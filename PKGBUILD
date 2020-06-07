# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gsubs-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A desktop app that finds you the perfect subtitle match"
arch=('x86_64')
url='https://cholaware.com/gsubs'
license=('MIT')
provides=('gsubs')
depends=('gconf'
         'alsa-lib'
         'gtk2'
         'libxtst'
         'nss'
         'libxss'
         'pango-legacy')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://github.com/sanjevirau/gsubs/releases/download/v${pkgver}/gsubs_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/sanjevirau/gsubs/raw/master/LICENSE')
sha256sums=('4ee26200acd919b7c86ae94c91b39df5ba9dec157faaba66f803a0478f658cac'
            '6d36933ec352f97ed680a03fa8267ee496a4985e151cfcfff43eb7cd6902d4c2')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "#!/usr/bin/env bash
  LD_LIBRARY_PATH=/opt/pango-legacy/usr/lib /opt/gSubs/gsubs" > gsubs.sh
  install -Dm755 gsubs.sh "${pkgdir}/usr/bin/gsubs"
  sed -i '4s|.*|Exec=gsubs|' "${pkgdir}/usr/share/applications/gsubs.desktop"
}