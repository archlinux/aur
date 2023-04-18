# Maintainer: nemanjan00 <nemanjan00@gmail.com>

pkgname=dsd
pkgver=1.7.0
pkgrel=1
pkgdesc="Decoder for P25, ProVoice, X2-TDMA, DMR/MOTOTRBO, NXDN"
arch=('i686' 'x86_64')
url="https://github.com/szechyjs/dsd"
license=('custom:copyright')
depends=('mbelib' 'itpp')
source=("dsd-$pkgver.tgz::https://github.com/szechyjs/dsd/archive/master.tar.gz")
md5sums=('278705be2e30704cce01b83024c597b9')

build() {
    cd "$srcdir/$pkgname-master"

    cmake -DCMAKE_INSTALL_PREFIX:STRING="$pkgdir/usr" . -Wno-dev

    # ./configure is baloney
    make DEST_BASE="/usr"
}

package() {
    cd "$srcdir/$pkgname-master"

    install -d "$pkgdir/usr/bin"
    echo "$pkgdir/usr/bin"
    make install
    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/$pkgname.txt"
}
