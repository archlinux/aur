pkgname=ueberzugpp
pkgver=2.7.1
pkgrel=1
pkgdesc="Command line util which allows to display images in combination with X11 written in C++"
arch=("x86_64")
url="https://github.com/jstkdng/ueberzugpp"
license=("GPL3")
makedepends=("cmake" "cli11")
depends=("opencv" "libvips" "xcb-util-image" "nlohmann-json" "libsixel" "openssl" "spdlog" "zeromq" "fmt")
source=("https://github.com/jstkdng/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('796ccbcecb8b777af4d85d95ae15ab36ee2a62c95ab0dc1616b8c9bb8fb2e111')
provides=("ueberzug")
conflicts=("ueberzug")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build --config Release
  ln -s "/usr/bin/ueberzug" "$pkgdir/usr/bin/ueberzugpp"
}

# vim:set ts=2 sw=2 et:
