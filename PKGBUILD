# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Adrian Sinclair <adrian@transloadit.com>

pkgname=eslint-plugin-node
pkgver=9.0.1
pkgrel=1
pkgdesc='Additional ESLint rules for Node.js'
arch=('any')
url='https://github.com/mysticatea/eslint-plugin-node'
license=('MIT')
depends=('eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('ffb38d463be2fd63ebd2c3217e064f7c')

package() {
  npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
