# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=editline
pkgver=1.17.1
pkgrel=1
pkgdesc="A readline() replacement for UNIX without termcap (ncurses)"
arch=('x86_64')
url="http://troglobit.com/editline.html"
license=('BSD')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/troglobit/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('6fd8951a490e0a3f30bb20d775036f622e583042d6dc315d657bb9fdad76b3f4e219290f24ab497209d6143a56dd1d227152ba0c40e7912b8a443ab50f9b05dd')

build () {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-gc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/share/man/man3/editline.3 $pkgdir/usr/share/man/man3/editline-troglobit.3

  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
