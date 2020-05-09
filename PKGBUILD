# Maintainer: Will Barnard <willbarnard687@pm.me>
# Contributer: Clint Valentine <valentine.clint@gmail.com>

pkgname=verifybamid
pkgver=1.1.3
pkgrel=1.1
pkgdesc="Verify identity and purity of sequence data"
arch=('x86_64')
url="https://genome.sph.umich.edu/wiki/VerifyBamID"
license=('GPL3')
depends=()
makedepends=('gcc-libs' 'zlib')
provides=('verifybamid')
conflicts=('verifybamid')
source=(
  "https://github.com/statgen/verifyBamID/archive/v${pkgver}.tar.gz"
  "libStatGen::git+https://github.com/statgen/libStatGen.git")
md5sums=('d542ca13e68b51e976d7f139ddee8cf5' 'SKIP')

build() {
  cd "${srcdir}/verifyBamID-${pkgver}"

  make -j4 
}

check() {
  cd "${srcdir}/verifyBamID-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/verifyBamID-${pkgver}"

  install -Dm775 "bin/verifyBamID" "${pkgdir}/usr/bin/verifyBamID"
  install -Dm644 "copyrights/LICENSE.txt" "${pkgdir}/usr/share/licenses/verifyBamID-${pkgver}/LICENSE.txt"
  install -Dm644 "copyrights/COPYING" "${pkgdir}/usr/share/licenses/verifyBamID-${pkgver}/COPYING"
  install -Dm644 "src/base/LICENSE" "${pkgdir}/usr/share/licenses/verifyBamID-${pkgver}/LICENSE_Chromium"
}
