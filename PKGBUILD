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
pkgver=5.0.0
pkgrel=2
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64')
license=("GPL2")
depends=('wxgtk3' 'gpsd' 'portaudio' 'tinyxml' 'hicolor-icon-theme')
makedepends=('cmake')
url="http://opencpn.org"
install=opencpn.install
source=("https://github.com/OpenCPN/OpenCPN/archive/v5.0.0.tar.gz" "wxWidgets.patch")
sha1sums=('9ef9ef76ccd94f2a970ef0689a487aec33b19125'
          'e40584dae18b4f4522e5e24491fb5cb212913467')

prepare() {
  cd "OpenCPN-${pkgver}"
  patch  --forward --strip=1 --input="${srcdir}/wxWidgets.patch"
}

build() {
  cd "OpenCPN-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUNDLE_GSHHS=CRUDE -DBUNDLE_TCDATA=ON -DBUNDLE_DOCS=ON \
        -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
        -DOCPN_FORCE_GTK3=ON
  make
}

package() {
  cd "OpenCPN-${pkgver}"
  make DESTDIR="$pkgdir" install
}
