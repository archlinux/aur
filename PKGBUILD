# Maintainer: Andrew Whatson <whatson@gmail.com>
_pkgname=emacsy
pkgname=guile-${_pkgname}
pkgver=0.4.1
pkgrel=1
pkgdesc='An embeddable Emacs-like library using GNU Guile'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('guile' 'guile-lib')
url="https://savannah.nongnu.org/projects/emacsy"
source=("https://download.savannah.nongnu.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "without-examples.patch")
sha256sums=('d792f7767d4633b381e061953bca806f5e59dd3e5074c1c8682bda405b41ebb2'
            '72968b2d320d154d75c0bf2d5211c9a2fe200a3421f03d598ae91e252d18aa51')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -p1 -i ../without-examples.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  GUILE=/usr/bin/guile ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
