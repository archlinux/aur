pkgname=ssmping
pkgver=0.9.1
pkgrel=4
pkgdesc="SSM ping"
arch=(x86_64)
url="http://www.venaas.no/multicast/ssmping/"
depends=('glibc')
license=('LicenseRef-custom')
source=(
  'http://http.debian.net/debian/pool/main/s/ssmping/ssmping_0.9.1.orig.tar.gz'
  'ssmping_x86_64.patch'
  'LICENSE'
)
sha512sums=(
  '7929b43867f29ac7f93298820149fd326d8540187a59e4f28f226e1c0dbfcdc60dc3da437de250e4082a2d6bd845ae9e619bf3b592b824dd8d529bf093cdedff'
  'a73afe31f1241261ab14e3c4fbcec17c2941894de512ee0e755eb123cf74ac0432fbb1ce52a508b1be0cd1023eba5d69ef536a4853039f847da2e6ee29b67031'
  'dac6d0aad1ead90503a3010de35b0a2718ebdf57b473cefab3bc159f1c9f6060f05aa413b1b3d2029d172d3aa2fe5def1860b4fa0627ecaf4cf75d21006a6733'
)

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i ../ssmping_x86_64.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  make CFLAGS="${CFLAGS} -D_GNU_SOURCE"
}


package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -d "${pkgdir}"/usr/share
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/man"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/custom"
}
