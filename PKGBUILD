# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-fft-bin
_pkgname=mkl_fft
_pkgver=1.0.6
_build=py39h63df603_0
_build_number=0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
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
sha256sums=('999e0468931a093860084f71372a6246f30519101fe0e6f53d367c35230b775f')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
