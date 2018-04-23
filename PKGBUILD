#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=scientifica-font
_gitname=scientifica
pkgver=1.0
pkgrel=1
pkgdesc='Tall and condensed bitmap font for geeks.'
arch=('any')
url="https://github.com/NerdyPepper/scientifica"
license=('SIL')
depends=('')
makedepends=('git' 'xorg-font-utils')
source=('git+https://github.com/NerdyPepper/scientifica.git')
sha256sums=('SKIP')

build() {
    mkdir $srcdir/pcf
    cd $srcdir/scientifica/regular || exit
    bdftopcf -o scientifica-11.pcf scientifica-11.bdf
    mv *.pcf ../../pcf
    cd ../bold || exit
    bdftopcf -o scientificaBold-11.pcf scientificaBold-11.bdf
    mv *.pcf ../../pcf
}

package() {
    cd "$_gitname"
    cd $srcdir/pcf || exit

    install -d -m755 "$pkgdir/usr/share/fonts/misc"
    install -D -m644 *.pcf "$pkgdir/usr/share/fonts/misc"
    install -D -m644 $srcdir/$_gitname/LICENSE "$pkgdir/usr/share/licenses/scientifica-font/LICENSE"
}
