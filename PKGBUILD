# Maintainer: Dominik Fuchs <d.fuchs@mail.com>

pkgname=gtksu-git
pkgver=r102.a8528e7
pkgrel=1
pkgdesc='A Qt5-based replacement for gksu'
arch=('any')
url='https://github.com/KeithDHedger/GtkSu'
license=('GPL')
depends=('qt5-base')
makedepends=('git' 'automake-1.15')
conflicts=('gksu')
provides=('gksu')
source=("$pkgname::git+https://github.com/KeithDHedger/GtkSu.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  # git describe can't describe anything without tags
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd $pkgname
   ./configure --enable-qt5 --prefix=/usr
   make || return 1
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  cd $pkgdir/usr/bin
  ln -s gtksu gksu
}
