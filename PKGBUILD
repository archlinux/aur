# Maintainer: JustKidding <jk@vin.ovh>

pkgname=ueberzugpp
pkgver=2.9.1
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=(any)
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "cli11" "nlohmann-json" "microsoft-gsl" "wayland-protocols" "extra-cmake-modules")
depends=("opencv" "libvips" "glib2" "libxcb" "xcb-util-image" "libsixel" "openssl" "spdlog" "libglvnd"
         "fmt" "turbo-base64" "chafa" "wayland" "onetbb" "glibc" "gcc-libs" "xcb-util-errors")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('dabf1f2334c982dc3a0fce2f04562138f3ab1b3e79e09e0a128a623a8cc91113')
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
  cmake --build build -j $(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
