# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  Robert Falkenberg <robert.falkenberg (at) tu-dortmund.de>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Robert Falkenberg <robert.falkenberg (at) tu-dortmund.de>
# Contributor: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer (at) gmail.com>
# Contributor: Jens Rudolf <jens.rudolf (at) gmx.net>

pkgname=librm-git
_pkgname=librm
pkgver=2.3.4.r0.g4ebbae3
pkgrel=1
pkgdesc="Router Manager library"
arch=('x86_64')
url="https://gitlab.com/tabos/librm"
license=('LGPL-2.1-only')

depends=(glib2 gdk-pixbuf2 libsoup speex libxml2 libtiff spandsp json-glib libsndfile gupnp-1.2 gssdp-1.2 gstreamer gst-plugins-base libsecret libcapi)
makedepends=(meson ninja ccache git)

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
