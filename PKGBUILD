# Maintainer: Achilleas Pipinellis <axil archlinux gr>

pkgname=facette-bin
_pkgname=facette
pkgver=0.5.1
pkgrel=1
pkgdesc="Time series data visualization and graphing software"
arch=('x86_64')
url="https://facette.io/"
license=('BSD')
depends=('rrdtool' 'nodejs')
install=facette.install
source=(
  "https://github.com/$_pkgname/$_pkgname/releases/download/$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
  "${_pkgname}.tmpfiles.d"
  "${_pkgname}.install"
  "${_pkgname}.service"
)
md5sums=('e1fc291a5287a26437250eb9428294c6'
         'fcb93f8e46194b925ed42fb801b47345'
         '79a4f9fb81dcf037d95373608b80d0a5'
         'f0bce7668dab66dc1ae3189c0b1b23db')

package() {
  # Create directory structure
  install -d "${pkgdir}"/usr/bin/

  # Install binaries
  install -Dm755 facette "${pkgdir}/usr/bin/facette"
  install -Dm755 facettectl "${pkgdir}/usr/bin/facettectl"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install systemd service and tmpfiles
  install -Dm644 facette.service     "${pkgdir}/usr/lib/systemd/system/facette.service"
  install -Dm644 facette.tmpfiles.d  "${pkgdir}/usr/lib/tmpfiles.d/facette.conf"
}
