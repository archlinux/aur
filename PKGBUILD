# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=nvtv
pkgver=0.4.7
pkgrel=3
pkgdesc='TV-out for NVidia cards'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/nv-tv-out'
license=('GPL')
depends=('gtk2' 'pciutils' 'libxmu' 'libxxf86vm')
makedepends=('quilt')
source=("http://http.debian.net/debian/pool/main/n/nvtv/nvtv_$pkgver.orig.tar.gz"
	"http://http.debian.net/debian/pool/main/n/nvtv/nvtv_$pkgver-8.debian.tar.gz")
sha256sums=('f044c6de2df66196fa589ed0d33203bd10d88604f447befce1a6f62eb7b08dac'
            '14fdab90295f74e82e17143faf3c1aaf23c30484c2d7b4de4d796a40b9281c31')

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

