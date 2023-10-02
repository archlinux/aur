# Maintainer: Lev Babiev <harley at hosers dot org>

pkgname=sfwbar
pkgver=1.0_beta13
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

sha256sums=('06abcfbdf1c0d1e547cdf5110a8b58f2997bbc243d350c2a3e02f70120ee0c5a')

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
