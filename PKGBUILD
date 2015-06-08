# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kde-cli-tools-git
pkgver=r1443.bc5bc76
pkgrel=1
pkgdesc="Tools based on KDE Frameworks 5 to better interact with the system"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/kde-cli-tools'
license=('LGPL')
depends=('kdesu-git' 'kdelibs4support-git' 'kcmutils-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
conflicts=('kde-cli-tools')
provides=('kde-cli-tools')
source=('git://anongit.kde.org/kde-cli-tools.git')
md5sums=('SKIP')

pkgver() {
  cd kde-cli-tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kde-cli-tools/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

# conflicts with kdebase-runtime
  rm -r "$pkgdir"/usr/share/man
}
