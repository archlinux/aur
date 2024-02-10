# Maintainer: Matthias Quintern <matthias.quintern(at)posteo.de>

pkgname=nextcloud-talk-desktop-bin
_pkgname=nextcloud-talk-desktop
pkgver=0.21.0
pkgrel=1
pkgdesc="Nextcloud Talk Desktop client based on Nextcloud Talk web application bundling"
arch=('x86_64')
url="https://github.com/nextcloud/talk-desktop"
license=('AGPL-3.0-only')
provides=('nextcloud-talk-desktop')

depends=()
optdepends=()
_archivename="${pkgname}-${pkgver}.zip"
source=(https://github.com/nextcloud-releases/talk-desktop/releases/download/v${pkgver}/Nextcloud.Talk-linux-x64-${pkgver}.zip
        'nextcloud-talk.svg'
        'nextcloud-talk.png'
        'nextcloud-talk.desktop')
        # nextcloud-talk.svg::'https://github.com/nextcloud/talk-desktop/blob/main/img/talk-icon-rounded.svg'

        
sha256sums=('cf4ad50a47086c590a7ca7d479578f9d2212d29445f013ab896e864857bc1023'
            'c657fd6071464318bc63ea09844470efc3d4210f179ed2deb8efee53052dac44'
            '8be5aed4243e7e25d46f41d68ebf7b3f85ebc4925e98391ad7e55fa98f2b83cb'
            '6da300342f6802ec1328c488b1c4786b87a462c9d2cc05b0ff55b1a03fbf32eb')

prepare() {
  # Avoid file name with space in /opt
  mv "${srcdir}/Nextcloud Talk-linux-x64/Nextcloud Talk" "${srcdir}/Nextcloud Talk-linux-x64/nextcloud-talk"
}

package() {
  install -d "${pkgdir}/opt/"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/pixmaps"

  # Archive contents
  mv "${srcdir}/Nextcloud Talk-linux-x64" "${pkgdir}/opt/${_pkgname}"
  chmod 0755 "${pkgdir}/opt/${_pkgname}"

  # Symlink in /usr/bin
  ln -s "/opt/nextcloud-talk-desktop/nextcloud-talk" "${pkgdir}/usr/bin/nextcloud-talk"

  # Icons
  install -m644 "${srcdir}/nextcloud-talk.svg" "${pkgdir}/usr/share/pixmaps/nextcloud-talk.svg"
  install -m644 "${srcdir}/nextcloud-talk.png" "${pkgdir}/usr/share/pixmaps/nextcloud-talk.png"

  # Desktop Entry
  install -m644 "${srcdir}/nextcloud-talk.desktop" "${pkgdir}/usr/share/applications/nextcloud-talk.desktop"
}
