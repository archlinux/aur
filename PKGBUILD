#Maintainer: Risikoch jo.risikoch at gmail[dot]com
pkgname=shelxle
pkgver=1.0.1859
pkgrel=1
pkgdesc="Graphical user interface for SHELXL and a viewer for crystal structures. SHELXL is required for refinement but must be obtained separately."
arch=('x86_64')
url="https://www.shelxle.org/"
license=('LGPL2.1')
depends=('qt6-base')
optdepends=('shelxl: required for structure refinement calculations (not in Arch repos)')
makedepends=('qt6-tools')
source=("shelxle-${pkgver}.tar.bz2::https://sourceforge.net/projects/shelxle/files/code/shelxle-${pkgver}.tar.bz2/download")
sha256sums=('f283f75baa40321f922be25955e0d1aee4304a9b0d5d14a19a3b60ca5366fba7')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  qmake6
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 shelxle.desktop \
        "$pkgdir/usr/share/applications/shelxle.desktop"
}

