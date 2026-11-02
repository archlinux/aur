#Maintainer: Risikoch jo.risikoch at gmail[dot]com
pkgname=shelxle
pkgver=1.0.1872
pkgrel=1
pkgdesc="Graphical user interface for SHELXL and a viewer for crystal structures. SHELXL is required for refinement but must be obtained separately."
arch=('x86_64')
url="https://www.shelxle.org/"
license=('LGPL2.1')
depends=('qt6-base')
optdepends=('shelxl: required for structure refinement calculations (not in Arch repos)')
makedepends=('qt6-tools')
source=("shelxle-${pkgver}.tar.bz2::https://sourceforge.net/projects/shelxle/files/code/shelxle-${pkgver}.tar.bz2/download")
sha256sums=('8e6df1c500dfd90b8958625447fd3de1bfe181e92c2bac67699f9c528648b457')

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

