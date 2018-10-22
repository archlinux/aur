# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=sealcrypto
pkgver=3.0
pkgrel=1
pkgdesc='Simple Encrypted Arithmetic Library'
arch=('any')
url="https://sealcrypto.org/"
license=('MSR-LA')
makedepends=('cmake')
source=("https://download.microsoft.com/download/B/3/7/B3720F6B-4F4A-4B54-9C6C-751EF194CBE7/SEAL_3.0.tar.gz")
sha1sums=('106914a237262a51a97ae9b87b0a35402978ea79')
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
