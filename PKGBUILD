# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=libraqm
pkgname=lib32-libraqm
pkgver=0.8.0
pkgrel=1
pkgdesc='A library that encapsulates the logic for complex text layout (32-bit)'
arch=(x86_64)
url='https://github.com/HOST-Oman/libraqm/'
license=(MIT)
depends=(lib32-freetype2 lib32-fribidi libraqm)
makedepends=(meson)
source=(https://github.com/HOST-Oman/libraqm/releases/download/v$pkgver/raqm-$pkgver.tar.xz)
sha256sums=('e9b5ed5e6c1ed1341307d3fba5e325cd65af60f89616597c4a191b1aa6e95d1e')

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    meson build raqm-$pkgver \
        --prefix=/usr \
        --libdir=lib32
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    rm -rf "$pkgdir/usr/include"

    install -D -m644 raqm-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
