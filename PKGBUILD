# Maintainer: JustKidding <jk@vin.ovh>
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=ueberzugpp-nogl
_pkgname=ueberzugpp
pkgver=2.9.6
pkgrel=2
pkgdesc="Command line util which allows to display images in combination with X11 written in C++ (without OpenGL support)"
arch=(x86_64 aarch64 powerpc64le)
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL-3.0-or-later")
makedepends=("cmake" "cli11" "nlohmann-json" "range-v3" "wayland-protocols" "extra-cmake-modules")
depends=("opencv" "libvips" "glib2" "libxcb" "xcb-util-image" "libsixel" "openssl" "spdlog"
         "fmt" "chafa" "wayland" "onetbb" "glibc" "gcc-libs" "xcb-util-errors")
source=("https://github.com/jstkdng/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('29cca04404c5883510aebf02846f608cfbf5892176bf4a48099e5167d5ef9d95')
provides=(ueberzug)
conflicts=(ueberzug ueberzugpp)
options=(debug)

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_TURBOBASE64=OFF \
        -DENABLE_WAYLAND=ON \
        -DENABLE_XCB_ERRORS=ON \
        -Wno-dev
  cmake --build build -j "$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
