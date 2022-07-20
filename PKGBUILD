# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=pipectl-git
pkgver=0.4.1.r0.g0bc6dbc
pkgrel=2
pkgdesc="a simple named pipe management utility (git version)"
url="https://github.com/Ferdi265/pipectl"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("pipectl=${pkgver%%.r*}")
conflicts=('pipectl')
depends=()
makedepends=('git' 'cmake' 'ninja' 'scdoc')
source=(
    "git+https://github.com/Ferdi265/pipectl"
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/pipectl"
    git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cmake -G Ninja -B build -S "$srcdir/pipectl" \
        -DINSTALL_DOCUMENTATION=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
