# Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=sierrabreeze-jomada-kwin-decoration-git
_gitname=SierraBreeze
pkgver=r65.a84c1c5
pkgrel=1
pkgdesc='Jomada Edition of SierraBreeze KWin decoration designed for Moe KDE Theme'
arch=('any')
url='https://github.com/jomada/SierraBreeze'
license=('GPL2')
depends=('kdecoration' 'qt5-declarative' 'qt5-x11extras')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('sierrabreeze-jomada-kwin-decoration')
conflicts=('sierrabreeze-jomada-kwin-decoration')
source=("git+${url}.git"
        'resolve_conflicts.patch')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd ${_gitname}
  git apply ${srcdir}/resolve_conflicts.patch
}

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_gitname}
    mkdir -p build
  cd build
  export DESTDIR=${pkgdir}
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make all
}

package() {
  cd ${_gitname}/build
  make install
}
