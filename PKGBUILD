# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=dooble-common
pkgver=1.56b
pkgrel=1
pkgdesc='Common files for package variants for Dooble'
url='http://dooble.sourceforge.net/'
arch=('any')
license=('custom:3-clause BSD')
depends=()
makedepends=('qt5-tools')
source=("dooble-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/dooble/Version%20${pkgver}/dooble-master.zip?r=")
sha256sums=('c4e2df630473bf4f16431462424a2f91a7fb7e0918f32e4e8674a79076eda23d')


build()
{
    cd "$srcdir/dooble-master/Version 1.x/"
    lupdate dooble.pro
    lrelease dooble.pro
}

package()
{
    cd "$srcdir/dooble-master/Version 1.x/"
    
    mkdir -p -- "${pkgdir}/usr/share/dooble/Translations"
    mv Translations/*.qm  -- "${pkgdir}/usr/share/dooble/Translations"
    cd '../Version 2.x'
    mv Icons Images Tab -- "${pkgdir}/usr/share/dooble"
    cd -
    
    for s in 16x16 48x48 64x64; do
	mkdir -p -- "${pkgdir}/usr/share/icons/hicolor/${s}"
	ln -s "../../../dooble/Icons/${s}/dooble.png" -- "${pkgdir}/usr/share/icons/hicolor/${s}/dooble.png"
    done
}

