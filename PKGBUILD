# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: StaCk <proc.null at gmail dot com>

pkgname=funny-manpages
pkgver=1.3
pkgrel=6
pkgdesc="A set of miscellaneous humorous manpages (don't take them too seriously!)."
arch=('any')
url="http://debian.org/"
license=('custom')
source=(http://ftp.debian.org/debian/pool/main/f/$pkgname/${pkgname}_$pkgver.orig.tar.gz
        http://ftp.debian.org/debian/pool/main/f/$pkgname/${pkgname}_$pkgver-5.diff.gz)
sha256sums=('5dcfcbb30a26585b53f27dc591b7e9cd485f738e603fa3fc9f074c55eabb6f91'
            'aea8369726213a8294f70c0d0b1637b2cf961d6208ad52fa97daf105e9452a53')

build() {
    # Apply the patch
    cd $srcdir
    patch -p0 -i ${pkgname}_$pkgver-5.diff || return 1

    # Rename the manpages to man6
    cd $pkgname-$pkgver.orig
    for f in *.[0-57-9]fun ; do
        mv $f ${f/.?fun/.6fun}
    done
}

package() {
    install -d $pkgdir/usr/share/man/man6/
    install -m 644 $srcdir/$pkgname-$pkgver.orig/*.6fun $pkgdir/usr/share/man/man6/

    # Install the license
    install -Dm 644 $srcdir/$pkgname-$pkgver.orig/debian/copyright $pkgdir/usr/share/licenses/$pkgname/copyright
}
