# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=vertica-client
pkgver=24.2.0
_pkgver=${pkgver}-0
pkgrel=1
pkgdesc="Client for the Vertica Analytic Database"
arch=('x86_64')
url="https://www.vertica.com/"
license=('custom: commercial')
PKGEXT=.pkg.tar
install=${pkgname}.install
depends=(java-runtime gcc-libs libxcrypt-compat)
optdepends=('java-environment: Needed for the JDBC client')
source=(https://www.vertica.com/client_drivers/${pkgver%.*}.x/${pkgver}-1/vertica-client-${pkgver}-1.x86_64.tar.gz
              LICENSE.pdf::https://www.vertica.com/wp-content/uploads/2024/02/Vertica-Client-License-Agreement_Feb2023.pdf)
sha256sums=('e4b097f6a82dc27246686bbbb603411e27c2046c10d92aa6db8053c51f97eed6'
            '2fcc497d2d8ca9e454d300776da094bbdc959d32d5d4eaf59594b6fa748fb1eb')

package() {
  install -d "${pkgdir}/usr/share/licenses/vertica-client"
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/usr/bin"
  
  cp -r "${srcdir}/opt/"* "${pkgdir}/opt/" -R
  install -m644 "${srcdir}/LICENSE.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
  ln -s /opt/vertica/bin/vsql "${pkgdir}/usr/bin/vsql"
}

