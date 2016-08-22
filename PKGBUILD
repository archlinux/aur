# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: Vuokko <vuokko@msn.com>

_gitname='libsigrok'
pkgname="${_gitname}-git"
pkgver=0.2.1.r2296.g817b744
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, core library (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrok"
license=('GPL3')
depends=('libzip' 'libftdi' 'alsa-lib' 'libserialport-git' 'glibmm' 'libieee1284')
makedepends=('git' 'autoconf-archive' 'doxygen')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/^libsigrok-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  PYTHON=python2 ./configure --prefix=/usr --disable-java

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm 644 'contrib/z60_libsigrok.rules' "${pkgdir}/usr/lib/udev/rules.d/60-libsigrok.rules"
}
