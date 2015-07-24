# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=cottage
pkgver=0.2.1
pkgrel=1

pkgdesc="Use howm commands, operators and set configuration values through a UNIX socket."
arch=('i686' 'x86_64')
url="https://github.com/HarveyHunt/cottage"
license=('GPL')

checkdepends=('linux-headers')
source=("https://github.com/HarveyHunt/cottage/archive/$pkgver.tar.gz")
sha256sums=('3daedc4a8771ca08d53662a3b9868ba2e7f30c00cadd64310b372833d9c6c3b2')

build() {
  cd "$pkgname-$pkgver"
  make release
}

check() {
  cd "$pkgname-$pkgver"
  find /usr/lib/modules -name checkpatch.pl -print -quit | xargs -i cp {} .
  make check
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/release/cottage "$pkgdir"/usr/bin/cottage
}

# vim:set ts=2 sw=2 et:
