# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=wl-restart-git
pkgver=0.2.0.r0.ged4f3be
pkgrel=1
pkgdesc="restart your compositor when it crashes (git version)"
url="https://github.com/Ferdi265/wl-restart"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("wl-restart=${pkgver%%.r*}")
conflicts=('wl-restart')
depends=()
makedepends=('git' 'cmake' 'ninja' 'scdoc')
source=(
    "git+https://github.com/Ferdi265/wl-restart"
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wl-restart"
    git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cmake -G Ninja -B build -S "$srcdir/wl-restart" \
        -DINSTALL_DOCUMENTATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
