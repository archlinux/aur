# Maintainer : Alois Nešpor <info@aloisnespor.info>
# Contributor : Pedro Martinez-Julia <pedromj@um.es>
# Contributor : Anugrah Redja Kusuma <anugrah.redja@gmail.com>
# Contributor : Vincent B. <vbmithr@gmail.com>

pkgname=libva-intel-driver-g45-h264
epoch=1
pkgver=1.8.1
pkgrel=1
pkgdesc="VA-API implementation for Intel G45 chipsets with H264 support."
arch=('i686' 'x86_64')
url='https://01.org/linuxmedia/vaapi'
license=(MIT)
depends=(libva)
conflicts=('libva-intel-driver')
provides=('libva-intel-driver')
replaces=('libva-intel-driver')
source=(https://bitbucket.org/alium/g45-h264/downloads/intel-driver-g45-h264-$pkgver.tar.gz)

prepare () {
    cd intel-vaapi-driver
    #./autogen.sh --prefix=/usr

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
sha256sums=('8708e8fad5a37f024c61b9cbeb41440689296553e72262eb6b5ff0640a51f28c')
