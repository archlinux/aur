# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=dooble-common
pkgver=1.56a
pkgrel=1
pkgdesc='Common files for package variants for Dooble'
url='http://dooble.sourceforge.net/'
arch=('any')
license=('custom:3-clause BSD')
depends=()
makedepends=('qtchooser')
source=("dooble-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/dooble/Version%20${pkgver}/Dooble.d.tar.gz?r=")
sha256sums=('3c89e0767250aa52faadf07fb62f7090c908d12efebcca9b4ba26dc3e7beda09')


build()
{
    cd "$srcdir/dooble.d/Version 1.x/"
    lupdate dooble.pro
    lrelease dooble.pro
}

package()
{
    cd "$srcdir/dooble.d/Version 1.x/"
    
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

