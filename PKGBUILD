# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto
pkgver=3.1.0
pkgrel=1
pkgdesc='Simple Encrypted Arithmetic Library'
arch=('any')
url="https://sealcrypto.org/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/SEAL/archive/${pkgver}.tar.gz")
sha1sums=('09a066ba97c58f2abd5d4e5d0955d29224d563e5')
provides=('sealcrypto')

build() {
  cd "${srcdir}"
  tar xf "SEAL_3.0.tar.gz"
  cd "SEAL_3.0/SEAL"
  cmake . -DSEAL_USE_MSGSL=OFF
  make
}

package() {
  cd "${srcdir}/SEAL_3.0"
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/include/seal/util"
  cp "lib/libseal.a" ${pkgdir}/usr/lib
  sed -i 's/#include "\(.*\)"/#include <\1>/g' SEAL/seal/*.h
  cp SEAL/seal/*.h ${pkgdir}/usr/include/seal
  sed -i 's/#include "\(.*\)"/#include <\1>/g' SEAL/seal/util/*.h
  cp SEAL/seal/util/*.h ${pkgdir}/usr/include/seal/util
}
