# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=wl-mirror
pkgver=0.12.1
pkgrel=5
pkgdesc="a simple Wayland output mirror client"
url="https://github.com/Ferdi265/wl-mirror"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libglvnd' 'wayland')
makedepends=('cmake' 'ninja' 'scdoc')
optdepends=(
    'pipectl: named pipe manager, for wl-present script'
    'slurp: selecting regions and outputs, for wl-present script'
    'rofi: interactively selecting options, for wl-present script'
    'dmenu: interactively selecting options, alternative, for wl-present script'
)
source=("wl-mirror-$pkgver.tar.gz::https://github.com/Ferdi265/wl-mirror/releases/download/v$pkgver/wl-mirror-$pkgver.tar.gz")
sha256sums=('ee2792cd212c6833eec21b14e3af8a611f303cb0149e79fcad827102b505a16f')

build() {
    cmake -G Ninja -B build -S "$srcdir/wl-mirror-$pkgver" \
        -DINSTALL_EXAMPLE_SCRIPTS=ON \
        -DINSTALL_DOCUMENTATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
