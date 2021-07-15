# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-random-bin
_pkgname=mkl_random
_pkgver=1.2.2
_build=py39h51133e4_0
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
epoch=1
pkgdesc="Sampling probability distributions using Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/IntelPython/mkl_random"
license=('custom')
provides=('python-mkl-random')
conflicts=('python-mkl-random')
depends=('python-mkl-service' 'python-numpy')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('f81f426f8ef306d636664bc49e7cdd70e2b4306d7c6bcb9c75fe35a45ab2087a')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
