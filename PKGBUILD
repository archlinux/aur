# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.7.3
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://gitlab.com/goodvibes/goodvibes"
license=('GPL')
depends=("libkeybinder3" "gst-plugins-base" "gst-plugins-bad" "gst-plugins-good" "gst-plugins-ugly")
makedepends=("meson")
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('14a2c70fa69eb5d69338df3782637e705b0baca5365e5a4fc2d2e45ac6c18414')

prepare() {
    # Remove broken weird git thing
    sed -i 140,161d "$pkgname-v$pkgver/meson.build"
    # Remove tests
    sed -i 94,104d "$pkgname-v$pkgver/meson.build"
}

build() {
    arch-meson -D tests=false "$pkgname-v$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
