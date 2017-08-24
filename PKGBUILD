# Maintainer: David Manouchehri
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: megamoth

_gitname='pulseview'
pkgname="${_gitname}-git"
pkgver=0.3.0.r436.g753c8f0
pkgrel=2
pkgdesc="A Qt based logic analyzer GUI for sigrok. (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://sigrok.org/wiki/Main_Page"
license=('GPL3')
depends=('libsigrok-git' 'libsigrokdecode-git' 'qt5-base' 'boost-libs' 'qt5-svg')
makedepends=('git' 'cmake' 'boost')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/^pulseview-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_CXX_FLAGS=-fext-numeric-literals .
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 contrib/org.sigrok.PulseView.desktop "${pkgdir}/usr/share/applications/pulseview.desktop"
}
