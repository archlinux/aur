# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=pipectl-git
pkgver=0.2.2.r0.gc2313da
pkgrel=1
pkgdesc="a simple named pipe management utility (git version)"
url="https://github.com/Ferdi265/pipectl"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("pipectl=${pkgver%%.r*}")
conflicts=('pipectl')
depends=()
makedepends=('git' 'cmake')
source=(
    "git+https://github.com/Ferdi265/pipectl"
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/pipectl"
    git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "$srcdir/pipectl" -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
