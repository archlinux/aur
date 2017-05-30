# Maintainer : Alois Nešpor <info@aloisnespor.info>
# Contributor : Pedro Martinez-Julia <pedromj@um.es>
# Contributor : Anugrah Redja Kusuma <anugrah.redja@gmail.com>
# Contributor : Vincent B. <vbmithr@gmail.com>

pkgname=libva-intel-driver-g45-h264
epoch=1
pkgver=1.8.2
pkgrel=1
pkgdesc="VA-API implementation for Intel G45 chipsets with H264 support."
arch=('i686' 'x86_64')
url='https://01.org/linuxmedia/vaapi'
license=(MIT)
depends=(libva)
conflicts=('libva-intel-driver')
provides=('libva-intel-driver')
replaces=('libva-intel-driver')
optdepends=('libva-utils: Applications and Scripts for libva (vainfo and others)')
source=(https://bitbucket.org/alium/g45-h264/downloads/intel-driver-g45-h264-$pkgver.tar.gz 
	fix_surface_querys.patch)

prepare () {
    cd intel-vaapi-driver
    #./autogen.sh --prefix=/usr
  patch -Np1 -i ../fix_surface_querys.patch
  # Only relevant if intel-gpu-tools is installed,
  # since then the shaders will be recompiled
  sed -i '1s/python$/&2/' src/shaders/gpp.py
}

build() {
  cd intel-vaapi-driver
  ./autogen.sh --prefix=/usr
  make
}

package () {
    cd intel-vaapi-driver
    make DESTDIR="${pkgdir}" install
    install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
sha256sums=('86afce92c83555abf16412689f181c3a7cfeef9727109f87c373466bffb22329'
            '64bb9d0fae82adba367de0e6ee21737cdb23a7d7eed1bae9f1536af1becbae92')
