# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Adrian Sinclair <adrian@transloadit.com>

pkgname=eslint-plugin-node
pkgver=11.0.0
pkgrel=1
pkgdesc='Additional ESLint rules for Node.js'
arch=('any')
url='https://github.com/mysticatea/eslint-plugin-node'
license=('MIT')
depends=('eslint')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('294b4985cb63f5134d4480c1eb001cb4')

package() {
  npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
