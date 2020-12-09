# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-numpy-mkl-bin
_pkgname=numpy-base
_pkgver=1.19.2
_build=py39h2ae0177_0
_build_number=0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
pkgrel=2
pkgdesc="Scientific tools for Python - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://www.numpy.org/"
license=('custom')
provides=('python-numpy' 'python-numpy-mkl')
conflicts=('python-numpy')
depends=('python-mkl-service')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('2d0760a9eafe8bd0367251a7dae8dbaf4abf69a09339111ad3ad43a3e265d545')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/bin" "${pkgdir}/usr/bin"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +

}
