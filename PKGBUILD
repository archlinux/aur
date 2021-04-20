# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: alium

pkgname=televize
pkgver=31
pkgrel=3
pkgdesc="CLI aplication to watch mainly Czech television streams"
arch=('any')
url="http://xpisar.wz.cz"
license=('GPL')
depends=('bash' 'wget' 'grep' 'sed' 'ctstream')
makedepends=('gendesk')
optdepends=('mplayer: for MPlayer backend'
            'mpv: for MPV backend'
            'rofi: for channel selection using rofi'
            'fzf: for channel selection in console using fzf')
install=${pkgname}.install
source=(http://xpisar.wz.cz/${pkgname}/${pkgname}-${pkgver}
        televize-menu)
sha256sums=('89602b9391241cbc9795c95d012f34f594b67703baf68e3fc82e5477941ec1ca'
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
