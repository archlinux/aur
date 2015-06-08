# ---------------------------------------------------------------
# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Original contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Original Maintainer: Anders Lund <anders at alweb dot dk>
# ---------------------------------------------------------------
# Adopted temporarily by Bruno Rodriguez (brunorro) on 2013-06-20 
# - Just changed the pkgver, the source and the md5sums to make
#   it work. If you can make it better, adopt it !
# ---------------------------------------------------------------

pkgname=opencpn
pkgver=4.0.0
pkgrel=2
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('i686' 'x86_64')
license=("GPL2")
depends=('wxgtk2.8' 'gpsd' 'portaudio' 'tinyxml' 'hicolor-icon-theme')
makedepends=('cmake')
url="http://opencpn.org"
install=opencpn.install
source=("https://github.com/OpenCPN/OpenCPN/archive/v4.0.0.tar.gz"
        "gcc5.patch")
sha1sums=('c128d1d17bdc3bc9c19d3ae2f2ee8ea1a3b5bc20'
          'e1b8bb165328104b927dd4c5b0d8704514008af5')

prepare() {
  cd "OpenCPN-${pkgver}"
  patch -Np1 -i ../gcc5.patch
}

build() {
  cd "OpenCPN-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr\
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.8\
    -DwxWidgets_wxrc_EXECUTABLE=/usr/bin/wxrc-2.8
  make
}

package() {
  cd "OpenCPN-${pkgver}"
  make DESTDIR="$pkgdir" install
}
