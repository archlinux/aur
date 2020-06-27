# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwallet-pam-git
pkgver=r223.94b9e27
pkgrel=1
pkgdesc='Unlock KWallet using PAM'
url='https://projects.kde.org/kwallet-pam'
license=('LGPL')
license=('GPL')
arch=('i686' 'x86_64')
depends=('kwallet-git' 'socat' 'pam' 'libgcrypt')
makedepends=('extra-cmake-modules-git' 'git')
conflicts=('kwallet-pam')
provides=('kwallet-pam')
source=('git+https://github.com/KDE/kwallet-pam.git')
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
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
