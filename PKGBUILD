# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-random-bin
_pkgname=mkl_random
_pkgver=1.0.2
_build=py39h63df603_0
_build_number=0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
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
sha256sums=('cba46e9c374cae08596a1edbd275e5c27fd29366cf9f19814a99393b3375b9a9')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
