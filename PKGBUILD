# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=nodejs-vls
_pkgname=vls
pkgver=0.5.9
pkgrel=1
pkgdesc='Vue language server (LSP)'
arch=('any')
url='https://github.com/vuejs/vetur/tree/master/server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('22c39561e24409e76605edef5b70056e9534729d8eccb6ff89a6d50bb4fee5b2')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
