# Maintainer: Dominik Fuchs <d.fuchs@mail.com>

pkgname=qgmailnotifier-git
pkgver=0.0.r7.84b71b5
pkgrel=1
pkgdesc='A portable Qt-based Gmail notifier'
arch=('any')
url='https://github.com/eteran/qgmailnotifier'
license=('GPL')
depends=('qt5-base')
makedepends=('git')
conflicts=('qgmailnotifier')
provides=("qgmailnotifier")
source=("$pkgname::git+https://github.com/eteran/qgmailnotifier.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  # git describe can't describe anything without tags
  printf "0.0.r%d.%s\n" $(git rev-list HEAD --count) $(git rev-parse --short HEAD)
}

build() {
   cd $pkgname
   qmake
   make || return 1
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/{bin,}
  make INSTALL_ROOT="${pkgdir}/usr" install
}