# Maintainer: Chris Coggburn <noderat at gmail dot com>

pkgname=libserdes-git
pkgver=r126.b259d15
pkgrel=1
pkgdesc='Schema-based serializer/deserializer C/C++ library with support for Avro and the Confluent Platform Schema Registry.'
url='https://github.com/confluentinc/libserdes'
license=('APACHE2')
source=(git+https://github.com/confluentinc/libserdes)
arch=(x86_64)
depends=(glibc jansson avro-c curl)
conflicts=(libserdes)
provides=(libserdes)
makedepends=(git)
sha256sums=('SKIP')

pkgver() {
  cd libserdes
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd libserdes
  # Use this line to compile with debugging symbols
  # ./configure --prefix=/usr --debug
  ./configure --prefix=/usr
  make
}

package() {
  cd libserdes
  make install DESTDIR="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
