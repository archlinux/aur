# Maintainer: Lev Babiev <harley at hosers dot org>

pkgname=sfwbar
pkgver=1.0_beta14
pkgrel=1

pkgdesc='S* Floating Window taskBar'
arch=('x86_64')
url='https://github.com/LBCrion/sfwbar'
license=('GPL3')
depends=(
    'wayland'
    'gtk3'
    'json-c'
    'gtk-layer-shell'
    'wayland-protocols'
    )
optdepends=(
    'alsa-lib: ALSA audio volume control',
    'libpulse: pulse audio volume control',
    'libmpdclient: music player daemon control',
    'libxkbcommon: xkb layout conversion support'
    )
makedepends=(
    'meson'
    )

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('e5fa6147e3a58e9440b24b8f1ef2378ae088631b8013ecf7770e984f97c5eeb4')

build() {
    cd "$pkgname-$pkgver"
    meson --prefix=/usr \
          --buildtype=plain \
          build
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
