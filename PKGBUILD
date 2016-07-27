# Maintainer: Dominik Fuchs <d.fuchs@mail.com>

pkgname=gtksu-git
pkgver=0.0.r98.9372747
pkgrel=1
pkgdesc='A Qt5-based replacement for gksu'
arch=('any')
url='https://github.com/KeithDHedger/GtkSu'
license=('GPL')
depends=('qt5-base')
makedepends=('git')
conflicts=('qgmailnotifier')
provides=("qgmailnotifier")
source=("$pkgname::git+https://github.com/KeithDHedger/GtkSu.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  # git describe can't describe anything without tags
  printf "0.0.r%d.%s\n" $(git rev-list HEAD --count) $(git rev-parse --short HEAD)
}

build() {
   cd $pkgname
   ./configure --enable-qt5
   make || return 1
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/{bin,}
  make INSTALL_ROOT="${pkgdir}/usr" install
}