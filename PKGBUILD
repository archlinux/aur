# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=httperf-git
pkgver=cc88843
pkgrel=1
epoch=1
pkgdesc="The HTTP load generator"
arch=('i686' 'x86_64')
url="https://github.com/httperf/httperf"
license=('GPL')
makedepends=('git')
provides=('httperf')
conflicts=('httperf')
source=("git+https://github.com/httperf/httperf.git")
sha256sums=('SKIP')


pkgver() {
    cd "httperf"

    git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "httperf"

    autoreconf -i
    mkdir -p "build"
}

build() {
    cd "httperf/build"

    ../configure --prefix=/usr
    make
}

package() {
    cd "httperf/build"

    make DESTDIR="$pkgdir" install
}
