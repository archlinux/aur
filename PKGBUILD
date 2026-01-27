# Maintainer: solarfire <xatra169@gmail.com>
pkgname='openssl-1.1'
pkgver='1.1.1w'
pkgrel='1'
pkgdesc='OpenSSL 1.1 legacy branch (deprecated)'

arch=('x86_64')
url='https://openssl-library.org/source/old/1.1.1'
license=('OpenSSL')
provides=('libcrypto.so=1.1-64' 'libssl.so=1.1-64')

depends=('glibc')
makedepends=('perl')

source=(
  "https://github.com/openssl/openssl/releases/download/OpenSSL_1_1_1w/openssl-${pkgver}.tar.gz"
)

sha512sums=(
  'b4c625fe56a4e690b57b6a011a225ad0cb3af54bd8fb67af77b5eceac55cc7191291d96a660c5b568a08a2fbf62b4612818e7cca1bb95b2b6b4fc649b0552b6d'
)

build() {
  cd "openssl-${pkgver}"

  ./config --prefix=/usr
  make -j$(nproc)
}

check() {
  cd "openssl-${pkgver}"
  make test
}

package() {
  cd "openssl-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
