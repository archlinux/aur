# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-fft-bin
_pkgname=mkl_fft
_pkgver=1.2.1
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
sha256sums=('1cb85327008cebbeff43500ea910436905b04ff7836660461666550feaeec4a2')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
