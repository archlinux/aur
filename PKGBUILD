# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwallet-pam-git
pkgver=r68.e411bd7
pkgrel=1
pkgdesc='Unlock KWallet using PAM'
url='https://projects.kde.org/kwallet-pam'
license=('LGPL')
license=('GPL')
arch=('i686' 'x86_64')
depends=('kwallet-git' 'pam')
makedepends=('extra-cmake-modules-git' 'git')
conflicts=('kwallet-pam')
provides=('kwallet-pam')
source=('git://anongit.kde.org/kwallet-pam.git')
md5sums=('SKIP')

pkgver() {
  cd kwallet-pam
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwallet-pam \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=usr/lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
