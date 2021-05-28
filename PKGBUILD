# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=vertica-client
pkgver=10.1.1
_pkgver=${pkgver}-0
pkgrel=1
pkgdesc="Client for the Vertica Analytic Database"
arch=('x86_64')
url="https://www.vertica.com/"
license=('custom: commercial')
PKGEXT=.pkg.tar
install=${pkgname}.install
depends=(java-runtime gcc-libs)
optdepends=('java-environment: Needed for the JDBC client')
source=(https://www.vertica.com/client_drivers/10.1.x/${_pkgver}/vertica-client-${_pkgver}.x86_64.tar.gz LICENSE)
sha256sums=('fdd7c5238146bceac3db4bedd16b5aa4b1038c51f3e66c0b9fcf25464d2667d9'
            '6e0cd8aec08647e568b34d70754bfa354106d610873f753ae66d987a0ae0a796')

if test "$CARCH" == i686; then
  __vertica_arch=i386
elif test "$CARCH" == x86_64; then
  __vertica_arch=x86_64
fi

package() {
  install -d "${pkgdir}/usr/share/licenses/vertica-client"
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/usr/bin"
  
  cp -r "${srcdir}/opt/"* "${pkgdir}/opt/" -R
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s /opt/vertica/bin/vsql "${pkgdir}/usr/bin/vsql"
}

