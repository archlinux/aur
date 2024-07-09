# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fspviewer
pkgver=2.2
pkgrel=1
pkgdesc="A standalone viewer for spherical (equirectangular) panoramic images"
arch=('x86_64')
url='http://www.fsoft.it/FSPViewer'
license=("custom:${pkgname}")
depends=('gtk2'
         'libsm'
         'libpng12')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.tar.gz::http://www.fsoft.it/FSPViewer/dwn-files/${pkgname}-${pkgver}-amd64.tar.gz"
        'fspviewer.png')
sha256sums=('349a0c747d13ccb42d64463718226b3e7bc98ad959f81b70c8f91a8c975fafce'
	    'SKIP')

package() {
  install -Dm755 fspviewer "${pkgdir}/usr/bin/${pkgname}"
  echo "This program is freeware: you can use it for free but the source code is not available." > LICENSE
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 fspviewer.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "FSPViewer" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Graphics;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
