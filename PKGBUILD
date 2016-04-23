# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=font-tester
_prname=font-tester
pkgver=0.1.0
pkgrel=1
pkgdesc='Font Tester'
arch=('i686' 'x86_64')
url='https://github.com/Kwpolska/font-tester'
license=('BSD')
depends=('qt5-base')
makedepends=('make' 'cmake')
options=(!emptydirs)
source=("${_prname}-${pkgver}.tar.gz::https://github.com/Kwpolska/${_prname}/archive/v${pkgver}.tar.gz")
md5sums=('c13475a3444fa976657d859fed938ac2')

prepare() {
  mkdir -p "${srcdir}/build"
  }

build() {
  cd "${srcdir}/build"
  cmake "../${_prname}-${pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}/${_prname}-${pkgver}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
