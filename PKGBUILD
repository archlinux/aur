# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
# Contributor: ross <prwarren8 at gmail dot com>
# Contributor: gpettinello <g_pet@hotmail.com>

pkgname=gabedit
pkgver=2.5.1
pkgrel=1
pkgdesc='A graphical user interface to computational chemistry packages'
arch=('i686' 'x86_64')
url='http://gabedit.sourceforge.net/'
license=('Custom')
depends=('pangox-compat' 'gtkglext')
_pkgver="${pkgver//\./}"  
_srcdir=".${srcdir}/GabeditSrc${_pkgver}"
source=("GabeditSrc251.tar.gz::https://prdownloads.sourceforge.net/gabedit/GabeditSrc${_pkgver}.tar.gz")
sha512sums=('bc02f95c605ebf0d3dc5ec41254424ba9263d49a473f3f2f9b70d15a0a32548dc90e0ee09c2903cbc24a84632b2103789b5785a83271c943ac2a97d6299e59ef')

build()
{
    cd ${_srcdir}
    cp platforms/CONFIG.unix CONFIG
    sed -i 's/-Wno-unused-variable/-Wno-unused-variable -fcommon/g' CONFIG
    make
    #LDFLAGS+=/lib/libm.so.6 make
}

package()
{
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/licenses/gabedit"
    mkdir -p "${pkgdir}/usr/share/applications/"

    install -D -m655 "${_srcdir}/gabedit" "${pkgdir}/usr/bin/"
    install -D -m644 "${_srcdir}/License" "${pkgdir}/usr/share/licenses/gabedit"

    install -D -m644 "${_srcdir}/utils/Others/gabedit.desktop" 	"${pkgdir}/usr/share/applications/"
    install -D -m644 "${_srcdir}/icons/Gabedit48.png" "${pkgdir}/usr/share/pixmaps/gabedit.png"
}
