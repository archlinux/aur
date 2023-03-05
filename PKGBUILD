# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=nodejs-vls
_pkgname=vls
pkgver=0.8.5
pkgrel=1
pkgdesc='Vue language server (LSP)'
arch=('any')
url='https://www.npmjs.com/package/vls'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('52e2b0bebd19278545bcc5a10c44bf870e87991fd0e8c8ed2bc0daf760019135')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
