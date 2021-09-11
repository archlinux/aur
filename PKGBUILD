# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=sponsoryeet-git
pkgver=27.e646eea
pkgrel=1
pkgdesc="Yeets Youtube sponsors away from your chromecast"
arch=(i686 x86_64)
url="https://github.com/sandsmark/sponsoryeet"
license=(GPL3)
depends=(openssl protobuf)
makedepends=(git cmake)
provides=(sponsoryeet)
conflicts=(sponsoryeet)
source=('git+https://github.com/sandsmark/sponsoryeet.git')
md5sums=('SKIP')

pkgver() {
    cd sponsoryeet
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../sponsoryeet \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
