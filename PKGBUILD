# Maintainer: Alex Xu <alex_y_xu@yahoo.ca>

pkgname=random-seed-git
pkgver=0.0.1.r16.cba728f
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

prepare() {
    cd $_srcname
    ./autogen.sh
}

build() {
    cd $_srcname
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin
    make
}

package() {
    cd $_srcname
    make DESTDIR="$pkgdir" install
}
