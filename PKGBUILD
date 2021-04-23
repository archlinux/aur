# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-service-bin
_pkgname=mkl-service
_pkgver=2.3.0
_build=py39h27cfd23_1
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
pkgdesc="Python bindings to MKL service functions - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/IntelPython/mkl-service"
license=('custom')
provides=('python-mkl-service')
conflicts=('python-mkl-service')
depends=('python' 'intel-mkl')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('7dedbd5b9db676aa6e1dbba36563146e0824ffc905931c83edd4badc72d56bb6')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prefix replacement:
  find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
