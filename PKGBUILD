# Maintainer: JustKidding <jk@vin.ovh>
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=ueberzugpp
pkgver=2.9.3
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=(x86_64 aarch64 powerpc64le)
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL-3.0-or-later")
makedepends=("cmake" "cli11" "nlohmann-json" "wayland-protocols" "extra-cmake-modules" "range-v3")
depends=("opencv" "libvips" "glib2" "libxcb" "xcb-util-image" "libsixel" "openssl" "spdlog" "libglvnd"
         "fmt" "turbo-base64" "chafa" "wayland" "onetbb" "glibc" "gcc-libs" "xcb-util-errors" "libexif")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('998d09cdc84254f758465e06a555d1d2ff7c4204f6a189425f456368b0b096ce')
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
