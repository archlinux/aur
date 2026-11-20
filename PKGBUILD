# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=tntnet
_commit=694079d9bcd3b869e5342c85dacfe72f737a60f8
pkgver=4.2
pkgrel=1
pkgdesc="Modular, multithreaded, high performance webapplicationserver for C++"
url="http://www.tntnet.org"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL2')
depends=('cxxtools' 'openssl' 'zlib' 'perl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/maekitalo/tntnet/archive/${_commit}.tar.gz")
sha256sums=('0d6435ae756bbbb89d129f038880be89e8c0349de36b0ce00809554ead86a93a')

build() {
  cd "${srcdir}/${pkgname}-${_commit}"
  autoreconf -i
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-unittest \
              --without-demos \
              --without-server
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"

  make DESTDIR="${pkgdir}" install
}
