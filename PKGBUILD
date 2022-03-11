# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=wl-mirror
pkgver=0.8.2
pkgrel=2
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
source=("$pkgname::https://github.com/Ferdi265/wl-mirror/releases/download/v$pkgver/wl-mirror-$pkgver.tar.gz")
sha256sums=('681ac2ab7175694ea9dc9fe1e55b4ad9ea12ae00c5bb755b132392c94d6fc649')

build() {
    cmake -B build -S "$srcdir/$pkgname-$pkgver" -DINSTALL_EXAMPLE_SCRIPTS=ON -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
