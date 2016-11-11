# Maintainer : Alois Nešpor <info@aloisnespor.info>
# Contributor : Pedro Martinez-Julia <pedromj@um.es>
# Contributor : Anugrah Redja Kusuma <anugrah.redja@gmail.com>
# Contributor : Vincent B. <vbmithr@gmail.com>

pkgname=libva-intel-driver-g45-h264
epoch=1
pkgver=1.7.3
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
source=(https://bitbucket.org/alium/g45-h264/downloads/libva-intel-driver-g45-h264-$pkgver.tar.gz)

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
sha256sums=('b9b31942635c92b76ca414ae9af7d3d3c8ef7be11fbb0922678cb30fd292e0d2')
