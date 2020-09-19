# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-fft-bin
_pkgname=mkl_fft
_pkgver=1.2.0
_build=py38h23d657b_0
_build_number=0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
pkgrel=3
pkgdesc="Fast Fourier Transform using Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/IntelPython/mkl_fft"
license=('custom')
provides=('python-mkl-fft')
conflicts=('python-mkl-fft')
depends=('python-mkl-service' 'python-numpy')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('79d9ba628abf260db647f44b4b435ff223a06775c138878ca881e29f9d87ff3e')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
