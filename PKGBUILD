# Maintainer: Doron Behar <doron.behar@gmail.com>
# Contributor: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=libkeyfinder
_name=libKeyFinder
pkgdesc="Musical key detection for digital audio."
url="http://www.ibrahimshaath.co.uk/keyfinder/"
license=('GPL3')
pkgver=2.2.1
pkgrel=1
source=(
  "https://github.com/ibsh/${_name}/archive/v${pkgver}.tar.gz"
  "cstring.patch"
)
sha256sums=(
  'f168247012da2467af846d5a1301ca3eff23eb48938fb9b2dbbfa8dd0e5ccf10'
  'c23242bbe3df5a4ed7fee805e5864dea7b96032715ccf51ced1694ed0ca975de'
)
depends=('fftw')
makedepends=('qt5-base')
arch=('i686' 'x86_64')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  patch -p1 < ../cstring.patch
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  mkdir -p ${pkgdir}/usr/include/keyfinder
  make INSTALL_ROOT="${pkgdir}" install
}
