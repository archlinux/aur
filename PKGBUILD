# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: StaCk <proc.null at gmail dot com>

pkgname=asr-manpages
pkgver=1.3
pkgrel=7
pkgdesc="A set of humorous manual pages developed on alt.sysadmin.recovery"
arch=('any')
url="http://debian.org/"
license=('custom')
source=(http://httpredir.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
        http://httpredir.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}-6.diff.gz)
sha256sums=('5c60c53eb9ebe5e6a26ca2bd1c920a2332ea2a6db3fd64b14ccc4537e955f354'
            '7d61485f61255ce23301f17eee74f8afc302f4482b8a64bfb1342ae4d39206fb')

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
