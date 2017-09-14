# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=nvtv
pkgver=0.4.7
pkgrel=2
pkgdesc='TV-out for NVidia cards'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/nv-tv-out'
license=('GPL')
depends=('gtk2' 'pciutils' 'libxmu')
makedepends=('quilt')
source=("https://downloads.sourceforge.net/project/nv-tv-out/nvtv-src/$pkgver/nvtv-$pkgver.tar.gz"
        "http://archive.ubuntu.com/ubuntu/pool/universe/n/nvtv/nvtv_$pkgver-8.debian.tar.gz")
md5sums=('35348d7608f94b7d114cd6ef46b66fc7'
         'f02bd41d3a17229214c3b1f5bd5da029')

prepare() {
    cd "$pkgname-$pkgver"
    cp -r "$srcdir"/debian/patches .
    quilt push -a
}

build() {
    cd "$pkgname-$pkgver"
    ./configure
    make
}

package() {
    cd "$pkgname-$pkgver"
    make prefix="$pkgdir/usr" install
}

