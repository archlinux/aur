# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=tntdb
pkgver=1.4
pkgrel=2
pkgdesc="C++-class-library for easy access to databases (only sqlite support)"
url="http://www.tntnet.org"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('cxxtools' 'sqlite')
source=("$pkgname-${pkgver}_git.tar.gz::https://github.com/maekitalo/tntdb/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('20f5d10817c0ad74f7728a0ca393337c0c73336dbc2b3273dcde22e5cc7cd76d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -i
  ./configure --prefix=/usr \
              --disable-static \
              --without-postgresql \
              --without-replicate \
              --without-mysql
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
