# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-contact-runner-git
pkgver=r206.c2afaad
pkgrel=1
pkgdesc='KRunner plugin for KDE Telepathy'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-kde-common-internals-git' 'krunner')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('telepathy-kde-contact-runner')
replaces=('telepathy-kde-contact-runner-frameworks-git')
source=("git://anongit.kde.org/ktp-contact-runner.git")
sha256sums=('SKIP')

pkgver() {
  cd ktp-contact-runner
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-contact-runner \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
