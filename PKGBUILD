# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-numpy-mkl-bin
_pkgname=numpy-base
_pkgver=1.19.1
_build=py38hfa32c7d_0
_build_number=0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
pkgrel=1
pkgdesc="Scientific tools for Python - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://www.numpy.org/"
license=('custom')
provides=('python-numpy' 'python-numpy-mkl')
conflicts=('python-numpy')
depends=('python-mkl-service')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('58315e53a89d3412630dfdd439a26881d59f73560080774fb3b0315907fa7ebd')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/bin" "${pkgdir}/usr/bin"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +

}
