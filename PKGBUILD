# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: alium

pkgname=televize
pkgver=40
pkgrel=1
pkgdesc="CLI aplication to watch mainly Czech television streams"
arch=('any')
url="http://xpisar.wz.cz"
license=('GPL-1.0-only')
depends=('bash' 'wget' 'grep' 'sed' 'ctstream')
makedepends=('gendesk')
optdepends=('mplayer: for MPlayer backend' 'mpv: for MPV backend'
            'rofi: for channel selection using rofi'
            'fzf: for channel selection in console using fzf')
source=(http://xpisar.wz.cz/${pkgname}/${pkgname}-${pkgver}
        televize-menu)
sha256sums=('a97bed73f738d62afb18e609aca827f8a9fdc29524f58456d9822c7d13748c0d'
            'f5366f74ee174cf6fd049ab5e43c70f14d93cad41ef66847059105c568973003')

prepare() {
  cd "${srcdir}"
  gendesk -f --icon video-television \
             --pkgname "${pkgname}" \
             --exec "televize-menu" \
             --pkgdesc "$pkgdesc" \
             --categories 'AudioVideo;TV'
}

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "televize-menu" "${pkgdir}/usr/bin/televize-menu"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
