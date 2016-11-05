# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=spectacle-git
pkgver=r330.1cf1282
pkgrel=1
pkgdesc='KDE screenshot capture utility'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdegraphics/spectacle'
license=('GPL')
depends=('xcb-util-cursor' 'libkipi' 'purpose')
makedepends=('git' 'extra-cmake-modules' 'kdoctools' 'python')
optdepends=('kipi-plugins: export to various online services')
conflicts=('spectacle' 'kscreengenie' 'kdegraphics-ksnapshot')
replaces=('kscreengenie' 'kdegraphics-ksnapshot')
provides=('spectacle')
groups=('kde-applications' 'kdegraphics')
source=("spectacle::git://anongit.kde.org/spectacle.git")
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
