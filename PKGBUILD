# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=snippy
pkgver=4.6.0
pkgrel=2
pkgdesc="Rapid haploid variant calling and core genome alignment."
arch=('x86_64')
url="https://github.com/tseemann/snippy"
license=('GPL')
depends=('perl' 'perl-bioperl')
provides=("snippy")
conflicts=("snippy-git" "snippy-bin")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0649c0cb5cefe63e9a0c2bb220b0046f315fe8696636be0b9b6585c644b1196d9275af91ae2c9e0360c061e4ff1f9b0462fcb0358b28b0cb63415f9c072cc475')

package() {
    cd $srcdir/$pkgname-$pkgver/

    mkdir -p $pkgdir/usr/share/$pkgname/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/$pkgname/binaries/

    cp -R bin $pkgdir/usr/share/$pkgname/
    chmod -R 755 $pkgdir/usr/share/$pkgname/bin

    cd $pkgdir/usr/share/$pkgname/bin
    for f in *; do
        echo "#!/bin/sh" >>$pkgdir/usr/bin/$f
        echo "exec /usr/bin/env perl /usr/share/$pkgname/bin/$f \"\$@\"" >>$pkgdir/usr/bin/$f
    done
    chmod -R 755 $pkgdir/usr/bin

    cd $srcdir/$pkgname-$pkgver/

    cp -R binaries/linux $pkgdir/usr/share/$pkgname/binaries/
    chmod -R 755 $pkgdir/usr/share/$pkgname/binaries

    cp -R etc $pkgdir/usr/share/$pkgname/
    chmod -R 644 $pkgdir/usr/share/$pkgname/etc

    cp -R perl5 $pkgdir/usr/share/$pkgname/
    chmod -R 755 $pkgdir/usr/share/$pkgname/perl5

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
