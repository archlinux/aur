# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=wl-mirror
pkgver=0.9.2
pkgrel=4
pkgdesc="a simple Wayland output mirror client"
url="https://github.com/Ferdi265/wl-mirror"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libglvnd' 'wayland')
optdepends=(
    'pipectl: named pipe manager, for wl-present script'
    'slurp: selecting regions and outputs, for wl-present script'
    'rofi: interactively selecting options, for wl-present script'
    'dmenu: interactively selecting options, alternative, for wl-present script'
)
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ferdi265/wl-mirror/releases/download/v$pkgver/wl-mirror-$pkgver.tar.gz")
sha256sums=('8cce423f31e8c1cbadf8c18e8097388d8f9fb35d7abf435eb7bf267fa3f4e12b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B build -DINSTALL_EXAMPLE_SCRIPTS=ON -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install
}
