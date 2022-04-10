# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=wl-mirror
pkgver=0.10.0
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
sha256sums=('7cdb9645504d79bebbcdf7ce604386025026f2a5274ce6002e53af5c3cd47d53')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B build -DINSTALL_EXAMPLE_SCRIPTS=ON -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install
}
