# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-numexpr-mkl-bin
_pkgname=numexpr
_pkgver=2.7.2
_build=py39hb2eb853_0
_build_number=0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
pkgrel=3
pkgdesc="Fast numerical array expression evaluator for Python - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/pydata/numexpr"
license=('MIT')
provides=('python-numexpr')
conflicts=('python-numexpr')
depends=('python-mkl-service' 'python-numpy')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('3fe65eaeb520756895d5a10b157c743fcf13c4d40e1555cccb4270be904ac703')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
