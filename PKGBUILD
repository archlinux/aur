# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=nodejs-vls
_pkgname=vls
pkgver=0.7.6
pkgrel=1
pkgdesc='Vue language server (LSP)'
arch=('any')
url='https://github.com/vuejs/vetur/tree/master/server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('f53815be8e4c9c4a4be7afbb418b5c11ba71e2408ffa32f7ab16625e2dc935ca')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
