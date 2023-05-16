pkgname=ueberzugpp
pkgver=2.8.3
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "cli11" "cppzmq" "nlohmann-json" "microsoft-gsl")
depends=("opencv" "libvips" "xcb-util-image" "libsixel" "openssl" "spdlog" "zeromq" "fmt" "turbo-base64")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9901087eceb3d1fed233703684610f33fa6516aa39155dbbc6ed64dad5ec5e1e')
provides=("ueberzug")
conflicts=("ueberzug")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_TURBOBASE64=ON \
        -Wno-dev
  cmake --build build -j $(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  ln -s "/usr/bin/ueberzug" "$pkgdir/usr/bin/ueberzugpp"
}

# vim:set ts=2 sw=2 et:
