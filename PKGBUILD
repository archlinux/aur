# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=httperf-git
pkgver=0c7d127
pkgrel=1
epoch=2
pkgdesc="The HTTP load generator"
arch=('i686' 'x86_64')
url="https://github.com/httperf/httperf"
license=('GPL')
makedepends=('git' 'openssl-1.0')
provides=('httperf')
conflicts=('httperf')
source=("git+https://github.com/httperf/httperf.git"
        "openssl-1.0.patch")
sha256sums=('SKIP'
            '14e17f66425dc8433255b6ba893e933dce3fabb37e860290f4cfaf3a24c36ac0')


prepare() {
    cd "httperf"

    patch -Np1 -i "$srcdir/openssl-1.0.patch"

    autoreconf -i
    mkdir -p "_build"
}

pkgver() {
    cd "httperf"

    git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "httperf/_build"

    ../configure --prefix=/usr
    make
}

package() {
    cd "httperf/_build"

    make DESTDIR="$pkgdir" install
}
