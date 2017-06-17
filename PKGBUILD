# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=qsynth
pkgname=${_pkgname}-git
pkgver=0.4.4.r6.g999e198
pkgrel=1
pkgdesc="A fluidsynth Qt GUI Interface (GIT version)"
arch=('i686' 'x86_64')
url="https://qsynth.sourceforge.io/"
license=('GPL2')
depends=('fluidsynth' 'qt5-x11extras')
makedepends=('qt5-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://git.code.sf.net/p/${_pkgname}/code")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long | sed -e 's/qsynth_//;s/_/./g;s/-/.r/;s/-/./'
}

build() {
  cd ${_pkgname}
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=release
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
