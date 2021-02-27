# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-fft-bin
_pkgname=mkl_fft
_pkgver=1.3.0
_build=py39h54f3939_0
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
epoch=1
pkgdesc="Fast Fourier Transform using Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/IntelPython/mkl_fft"
license=('custom')
provides=('python-mkl-fft')
conflicts=('python-mkl-fft')
depends=('python-mkl-service' 'python-numpy')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('ffedf2e6fc4fd28c050d3082d7d6118471385ed23ac1c5414bd0a240bad52cc1')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
