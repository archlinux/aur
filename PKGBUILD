# Maintainer:  Conrad Hoffmann <ch@bitfehler.net>

pkgname=netplan
pkgver=0.98
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
  'make-fixes.patch'
)
sha256sums=(
  '2cc5511eb1675950f37c361e3056fcb17ca213998db7911cbe34511362641d92'
  '7c4f0ca9fa822a5493a3d7dbad2c374cfc489699d4aa105784519617a841deb8'
)

prepare(){
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "$srcdir/make-fixes.patch"
  env
}

build(){
  cd "${pkgname}-${pkgver}"
  env
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir}/ ROOTPREFIX=/usr SBINDIR=/usr/bin install
}
