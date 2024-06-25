# Maintainer: JustKidding <jk@vin.ovh>
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=ueberzugpp
pkgver=2.9.6
pkgrel=2
pkgdesc="Command line utility which allows to display images in the terminal, written in C++"
arch=(x86_64 aarch64 powerpc64le)
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL-3.0-or-later")
makedepends=("cmake" "cli11" "nlohmann-json" "wayland-protocols" "extra-cmake-modules" "range-v3")
depends=("opencv" "libvips" "glib2" "libxcb" "xcb-util-image" "libsixel" "openssl" "spdlog" "libglvnd"
         "fmt" "turbo-base64" "chafa" "wayland" "onetbb" "glibc" "gcc-libs" "xcb-util-errors")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('29cca04404c5883510aebf02846f608cfbf5892176bf4a48099e5167d5ef9d95')
provides=("ueberzug")
conflicts=("ueberzug")
options=("debug")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_TURBOBASE64=ON \
        -DENABLE_WAYLAND=ON \
        -DENABLE_XCB_ERRORS=ON \
        -DENABLE_OPENGL=ON \
        -Wno-dev
  cmake --build build -j "$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
