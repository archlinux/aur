pkgname=ueberzugpp
pkgver=2.7.7
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "cli11")
depends=("opencv" "libvips" "xcb-util-image" "nlohmann-json" "libsixel" "openssl" "spdlog" "zeromq" "fmt")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0a1ab82faadf9742bf873813b88e393645e9af3f53495b465a942ea25c495cc2')
provides=("ueberzug")
conflicts=("ueberzug")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build -j $(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  ln -s "/usr/bin/ueberzug" "$pkgdir/usr/bin/ueberzugpp"
}

# vim:set ts=2 sw=2 et:
