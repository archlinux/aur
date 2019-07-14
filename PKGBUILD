# Maintainer:  Conrad Hoffmann <ch@bitfehler.net>

pkgname=netplan
pkgver=0.97
pkgrel=1
pkgdesc="The network configuration abstraction renderer"
arch=('i686' 'x86_64')
url="https://netplan.io"
license=('GPL3')
depends=(
  'glib2'
  'python-yaml'
  'python-netifaces'
  'iproute2'
)
makedepends=(
  'python'
  'pkgconf'
  'pandoc'
)
source=(
  "https://github.com/CanonicalLtd/${pkgname}/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '2f63695d46fc61a094935fd74fb319b4b48942a6c87fb9885e29be3ca0f3b9ee'
)

prepare(){
  cd "${pkgname}-${pkgver}"

  # The systemd generator is compiled and linked in a single command, but it
  # only honors CFLAGS, not LDFLAGS.  Inject LDFLAGS into CFLAGS as a temporary
  # workaround.
  make CFLAGS="${CFLAGS} ${LDFLAGS}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir}/ ROOTPREFIX=/usr SBINDIR=/usr/bin install
}
