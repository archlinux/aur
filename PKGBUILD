# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=spectacle-git
pkgver=r123.26ede97
pkgrel=1
pkgdesc='The new screenshot capture utility, replaces KSnapshot'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/spectacle'
license=('LGPL')
depends=('kio' 'libkscreen' 'xcb-util-cursor' 'libkipi-git')
makedepends=('extra-cmake-modules' 'git')
conflicts=('spectacle-git' 'kscreengenie-git' 'kdegraphics-ksnapshot')
replaces=('kscreengenie-git' 'kdegraphics-ksnapshot')
install=${pkgname}.install
source=('git://anongit.kde.org/spectacle.git')
md5sums=('SKIP')

pkgver() {
  cd spectacle
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../spectacle \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
