# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=dropwatch
pkgver=1.5.4
pkgrel=1
pkgdesc='Project to detect packet drops in Linux kernel'
arch=('x86_64')
url='https://github.com/nhorman/dropwatch'
license=('GPL2')
source=("https://github.com/nhorman/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8c43d0c15d0cb9ce179fa1fb0610611723689a6f551b23c70a7ddc1cf068e8d2')
depends=(
    'libpcap'
    'libnl'
)

prepare() {
    cd "$srcdir/$_pkgname"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
