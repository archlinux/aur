# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=phonon-qt6-mpv-git
pkgdesc='Phonon MPV backend for Qt6 (git)'
pkgver=0.0.7.r5.g384ae0a
pkgrel=2
arch=(x86_64)
url=https://github.com/OpenProgger/phonon-mpv
license=(LGPL-2.1-only)
depends=(gcc-libs glibc mpv phonon-qt6 qt6-base)
makedepends=(extra-cmake-modules qt6-tools git)
provides=("${pkgname%-git}" phonon-qt6-backend)
conflicts=("${pkgname%-git}")
source=(git+https://github.com/OpenProgger/phonon-mpv.git)
sha256sums=('SKIP')

pkgver() {
    git -C phonon-mpv describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S phonon-mpv \
        -DPHONON_BUILD_QT5=OFF \
        -DPHONON_BUILD_QT6=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
