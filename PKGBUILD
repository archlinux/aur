# Maintainer: Joshua Hardy joshinsilico
pkgname=xdsgui
pkgver=20170125
pkgrel=1
pkgdesc="Graphical user interface for X-ray Detector Software."
arch=(x86_64)
url="http://strucbio.biologie.uni-konstanz.de/xdswiki/index.php/XDSGUI/"
license=('CCPL:cc-by-nc-nd-3.0')
depends=('qt4' 'xds' 'xds-viewer')
makedepends=('wget')
optdepends=('xdsstat')
source=("ftp://turn5.biologie.uni-konstanz.de/pub/xdsgui.rhel6.64")
md5sums=('72c6794a6d6fa428249faf42ee1c0032')
prepare() {
#fetching generate_XDS.INP script
cd "${srcdir}"
wget http://strucbio.biologie.uni-konstanz.de/xdswiki/index.php/generate_XDS.INP -O - | \
   sed -e s/\&nbsp\;/\ /g -e s/\&gt\;/\>/g -e s/\&lt\;/\</g -e s/amp\;//g -e s/\&quot\;/\"/g -e s/\&\#\1\6\0\;/\ /g | \
   sed '/# end of generate_XDS.INP/,$d' | awk '/^#/,/rm -f tmp1 tmp2/' > generate_XDS.INP
}

package() {
	install -d "${pkgdir}"/usr "${pkgdir}"/usr/bin
	install -D -m755 "${srcdir}"/xdsgui.rhel6.64 "${pkgdir}"/usr/bin/xdsgui
	install -D -m755 "${srcdir}"/generate_XDS.INP "${pkgdir}"/usr/bin/.
}
