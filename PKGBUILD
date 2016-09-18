# Maintainer : Pedro Martinez-Julia <pedromj@um.es>
# Contributor : Alois Nešpor info@aloisnespor.info
# Contributor : Anugrah Redja Kusuma <anugrah.redja@gmail.com>
# Contributor : Vincent B. <vbmithr@gmail.com>

pkgname=libva-intel-driver-g45-h264
epoch=1
pkgver=1.7.2
pkgrel=1
pkgdesc="VA-API implementation for Intel G45 chipsets with H264 support."
arch=('i686' 'x86_64')
url="http://freedesktop.org/wiki/Software/vaapi"
license=('MIT')
makedepends=('automake' 'libtool' 'python2')
depends=(libva)
options=('!libtool')
conflicts=('libva-intel-driver')
provides=('libva-intel-driver')
replaces=('libva-intel-driver')
source=(https://bitbucket.org/alium/g45-h264/downloads/intel-driver-g45-h264-$pkgver.tar.gz)

build () {
    cd "$srcdir"/libva-intel-driver
    ./autogen.sh --prefix=/usr
    sed -i 's|/usr/bin/env python|/usr/bin/env python2|' src/shaders/gpp.py
    make
}

package () {
    cd ${srcdir}/libva-intel-driver
    make DESTDIR="${pkgdir}" install
    install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
sha256sums=('b12a327424a1aca0ab7ce616586b3b58037a0341164cddfa45c2a80205fe4db2')
