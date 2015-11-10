# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=dooble-common
pkgver=1.55
pkgrel=1
pkgdesc='Common files for package variants for Dooble'
url='http://dooble.sourceforge.net/'
arch=('any')
license=('custom:3-clause BSD')
depends=()
makedepends=('qtchooser')
source=("dooble-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/dooble/Version%20${pkgver}/Dooble_Src.d.tar.gz?r=")
sha256sums=('024003e7c397a925d48e41cba10a2a35b89dd1745120caf4fd2010c1e254c5e5')


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
    mv Icons Images Plugins Tab -- "${pkgdir}/usr/share/dooble"
    
    mkdir -p -- "${pkgdir}/usr/lib/dooble"
    mv plugin-spec -- "${pkgdir}/usr/lib/dooble"
    
    for s in 16x16 48x48 64x64; do
	mkdir -p -- "${pkgdir}/usr/share/icons/hicolor/${s}"
	ln -s "../../../dooble/Icons/${s}/dooble.png" -- "${pkgdir}/usr/share/icons/hicolor/${s}/dooble.png"
    done
}

