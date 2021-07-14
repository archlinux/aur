# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-service-bin
_pkgname=mkl-service
_pkgver=2.4.0
_build=py39h7f8727e_0
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
epoch=1
pkgdesc="Python bindings to MKL service functions - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/IntelPython/mkl-service"
license=('custom')
provides=('python-mkl-service')
conflicts=('python-mkl-service')
depends=('python' 'intel-mkl')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('5394f5efd53afb2c1b0abf571ce3d9cb684b6c7e255f140ba2acaa703d6113be')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
