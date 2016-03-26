# Maintainer : Pedro Martinez-Julia <pedromj@um.es>
# Contributor : Alois Nešpor info@aloisnespor.info
# Contributor : Anugrah Redja Kusuma <anugrah.redja@gmail.com>
# Contributor : Vincent B. <vbmithr@gmail.com>

pkgname=libva-intel-driver-g45-h264
epoch=1
pkgver=1.7.0
pkgrel=1
pkgdesc="VA-API implementation for Intel G45 chipsets with H264 support."
arch=('i686' 'x86_64')
url="http://freedesktop.org/wiki/Software/vaapi"
license=('MIT')
makedepends=('automake' 'libtool' 'python2')
depends=('libva')
options=('!libtool')
conflicts=('libva-intel-driver')
provides=('libva-intel-driver')
replaces=('libva-intel-driver')
source=(https://bitbucket.org/alium/g45-h264/downloads/intel-driver-g45-h264-$pkgver.tar.gz)

#prepare(){
    # fix BUG 93499
#    cd "$srcdir"/intel-driver-g45-h264
#    patch -Np1 -i ../bug93499.patch
#}

build () {
    cd "$srcdir"/intel-driver-g45-h264
    ./autogen.sh --prefix=/usr
    sed -i 's|/usr/bin/env python|/usr/bin/env python2|' src/shaders/gpp.py
    make
}

package () {
    cd ${srcdir}/intel-driver-g45-h264
    make DESTDIR="${pkgdir}" install
    install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
sha256sums=('a2833d77a227ee96523d0f313204d442529d43bd8a6e2a882192b130ebf581d3')
