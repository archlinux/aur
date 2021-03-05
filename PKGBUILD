# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-numexpr-mkl-bin
_pkgname=numexpr
_pkgver=2.7.3
_build=py39hb2eb853_0
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
pkgdesc="Fast numerical array expression evaluator for Python - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/pydata/numexpr"
license=('MIT')
provides=('python-numexpr')
conflicts=('python-numexpr')
depends=('python-mkl-service' 'python-numpy')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('a0c660f737b65728d789ac651b45b79c99d8aca24eebb201e4bc0669899abed7')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
