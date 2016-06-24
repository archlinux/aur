# Maintainer: Antonio Rojas <arojas@archlinux.org> 

pkgname=discover-git
pkgver=r4327.f537e89
pkgrel=2
pkgdesc='KDE and Plasma resources management GUI'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/workspace/discover'
license=(LGPL)
depends=(packagekit-qt5 knewstuff appstream-qt archlinux-appstream-data hicolor-icon-theme)
makedepends=(extra-cmake-modules-git git python plasma-framework)
conflicts=(muon discover muon-git)
provides=(discover)
replaces=(muon-git)
source=('git://anongit.kde.org/discover.git')
groups=(plasma)
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd discover
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../discover \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
