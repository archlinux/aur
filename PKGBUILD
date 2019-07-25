pkgname=nbis
pkgver=5.0.0
pkgrel=1
pkgdesc="NIST Biometric Image Software"
arch=('x86_64')
url="https://www.nist.gov/services-resources/software/nist-biometric-image-software-nbis"
license=('custom')
depends=('libx11')
makedepends=('cmake')
options=('!makeflags')
source=("https://nigos.nist.gov/nist/nbis/nbis_v5_0_0.zip")
sha256sums=('0adf8ab0f6b0e4208de50ca00ba21d3d77112ecd66288757ddfed21f6bee92c3')

package() {
  cd "$srcdir/Rel_$pkgver"
  install -d "${pkgdir}/usr"
  ./setup.sh "${pkgdir}/usr"
  make config
  make it
  make install
  rm "${pkgdir}"/usr/bin/{cjpeg,djpeg,jpegtran,rdjpgcom,wrjpgcom}
  rm -r "${pkgdir}"/usr/include
  rm -r "${pkgdir}"/usr/lib/
  rm "${pkgdir}"/usr/man/man1/{wrjpgcom.1,rdjpgcom.1,djpeg.1}
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/nbis" "${pkgdir}/usr/share"
}
