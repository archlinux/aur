# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=pulseview
pkgver=0.2.0
pkgrel=1
pkgdesc="A Qt based logic analyzer GUI for sigrok."
arch=('i686' 'x86_64')
url="http://sigrok.org/wiki/Main_Page"
license=('GPL3')
depends=('libsigrok' 'libsigrokdecode' 'qt4' 'boost-libs')
makedepends=('cmake' 'boost')
source=("http://sigrok.org/download/source/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'pulseview.desktop')
md5sums=('fe5586212671226afafe9d8d80ed10c6'
         'f816b4aff1ddf5683d5df94e69576ec7')
install=${pkgname}.install

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 ../pulseview.desktop "$pkgdir/usr/share/applications/pulseview.desktop"
}

# vim:set ts=2 sw=2 et:
