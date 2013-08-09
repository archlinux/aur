# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: StaCk <proc.null at gmail dot com>

pkgname=asr-manpages
pkgver=1.3
pkgrel=5
pkgdesc="A set of humorous manual pages developed on alt.sysadmin.recovery"
arch=('any')
url="http://debian.org/"
license=('custom')
source=(http://ftp.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
        http://ftp.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}-6.diff.gz)
md5sums=('ee77b619e01a2d841a45469708d90631'
         '9608fb9ee121a278bf4cac5fc6dae267')

build() {
    cd $srcdir

    # Apply the patch
    patch -p0 -i ${pkgname}_$pkgver-6.diff || return 1

    # Rename the manpages to man6
    cd $pkgname-$pkgver.orig
    for f in *.[0-57-9]fun ; do
        mv $f ${f/.?fun/.6fun}
    done
}

package() {
    install -d $pkgdir/usr/share/man/man6/
    install -m 644 $srcdir/$pkgname-$pkgver.orig/*.6fun \
                                                    $pkgdir/usr/share/man/man6/

    # Install the license
    install -Dm 644 $srcdir/$pkgname-$pkgver.orig/debian/copyright \
                                  $pkgdir/usr/share/licenses/$pkgname/copyright
}
