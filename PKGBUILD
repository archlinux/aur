# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>
# Contributor: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jens Rudolf <jens.rudolf@gmx.net>

pkgname=librm-git
_pkgname=librm
pkgver=2.2.3.r9.g633a436
pkgrel=1
pkgdesc="Router Manager library"
arch=('x86_64')
url="https://www.tabos.org/"
license=('GPL2')

depends=(glib2 gdk-pixbuf2 libsoup speex libxml2 libtiff spandsp json-glib libsndfile gupnp gssdp gstreamer gst-plugins-base libsecret libcapi)
makedepends=(meson ninja)

options=('!emptydirs')
provides=('librm')
conflicts=('librm')
source=("git+https://gitlab.com/tabos/librm.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  meson --prefix /usr --buildtype=plain "builddir"
  ninja -v -C "builddir"
}

check() {
  cd "${srcdir}/${_pkgname}"
  ninja -C "builddir" test
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="$pkgdir" ninja -C "builddir" install
}
