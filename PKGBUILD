# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: StaCk <proc.null at gmail dot com>

pkgname=funny-manpages
pkgver=2.3
pkgrel=1
pkgdesc="A set of miscellaneous humorous manpages (don't take them too seriously!)."
arch=('any')
url="http://debian.org/"
license=('custom')
source=("https://github.com/ltworf/${pkgname}/releases/download/${pkgver}/${pkgname}_${pkgver}.orig.tar.gz")
sha512sums=('7920e9a62972f8ea0649b50d0b108936a6e0a5d5b68baccadded4999d0219af3f4685349dd881aded9e762e0d1f00575f382d155db0969f7e51a4a1963f0519e')

build() {
    # Rename the manpages to man6
    cd $srcdir/$pkgname/man
    for f in *.[0-57-9]fun ; do
        mv $f ${f/.?fun/.6fun}
    done
}

package() {
    install -d $pkgdir/usr/share/man/man6/
    install -m 644 $srcdir/$pkgname/man/*.6fun $pkgdir/usr/share/man/man6/

    # Install the license
    install -Dm 644 $srcdir/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
