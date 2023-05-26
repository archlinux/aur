pkgname=ueberzugpp
pkgver=2.8.5
pkgrel=2
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "cli11" "nlohmann-json" "microsoft-gsl" "wayland-protocols" "extra-cmake-modules")
depends=("opencv" "libvips" "xcb-util-image" "libsixel" "openssl" "spdlog" "fmt" "turbo-base64" "chafa" "wayland")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2788e63f233eb5fb925e371db8a1d89289c1062aa854b7de5685397518fd678b')
provides=("ueberzug")
conflicts=("ueberzug")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_TURBOBASE64=ON \
        -DENABLE_SWAY=ON \
        -Wno-dev
  cmake --build build -j $(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  ln -s "/usr/bin/ueberzug" "$pkgdir/usr/bin/ueberzugpp"
}

# vim:set ts=2 sw=2 et:
