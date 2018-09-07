# Maintainer: Alex Xu <alex_y_xu@yahoo.ca>

pkgname=random-seed-git
pkgver=0.0.1.r20.9e7848f
pkgrel=1
pkgdesc="random seed manager"
arch=('x86_64')
url=""
license=(BSD)
makedepends=(autoconf autoconf-archive git make pkg-config)
provides=(random-seed)
conflicts=(random-seed)
source=(git+https://git.alxu.ca/random-seed.git)
_srcname=random-seed
md5sums=('SKIP')

pkgver() {
    cd $_srcname

    printf "%s" "$(git describe --long | sed 's/\([^-  ]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd $_srcname

    ./autogen.sh

    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin

    make
}

check() {
    cd $_srcname

    make test
}

package() {
    cd $_srcname

    make DESTDIR="$pkgdir" install
}
