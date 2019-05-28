# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

pkgname=librm
pkgver=2.1.0
pkgrel=1
pkgdesc="Router Manager library"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')

depends=(glib2 gdk-pixbuf2 libsoup speex libxml2 libtiff spandsp json-glib libsndfile gupnp-1.0 gssdp-1.0 gstreamer gst-plugins-base isdn4k-utils libsecret)
makedepends=(meson git)

options=('!emptydirs')
# source=("git+https://git.krueger-it.net/tabos.org/${pkgname}.git#tag=v${pkgver}")
source=("git+https://gitlab.com/tabos/${pkgname}.git#tag=v${pkgver}")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd "${srcdir}/${pkgname}"
  meson --prefix /usr --buildtype=plain "builddir"
  ninja -v -C "builddir"
}

check() {
  cd "${srcdir}/${pkgname}"
  ninja -C "builddir" test
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" ninja -C "builddir" install
}
