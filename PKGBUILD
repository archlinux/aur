# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=videodownloader
pkgname=videodownloader
pkgver=1.3.7
pkgrel=1
pkgdesc='A video downloader with Qt GUI (currently only YouTube and Vimeo are maintained)'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'qt6-base'
    'openssl'
    'hicolor-icon-theme'
)
makedepends=(
    'clang'
    'cmake'
    'c++utilities'
    'qtutilities'
    'ninja'
    'qt6-tools'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('33fdaf12b5f14f9a7f89729a353cae478a1141b10d471fcbbb03bf47249d7991')

build() {
    local cmake_options=(
        -B build
        -S "${PROJECT_DIR_NAME:-$pkgbase-$pkgver}"
        -G Ninja
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_SHARED_LIBS=ON
        -D QT_PACKAGE_PREFIX=Qt6
        -D BUILTIN_TRANSLATIONS=ON
        -D BUILTIN_TRANSLATIONS_OF_QT=OFF
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    depends+=(
        'libc++utilities.so'
        'libqtutilities.so'
    )

    DESTDIR="${pkgdir}" cmake --install build
}
