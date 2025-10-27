# Maintainer: Matthias Quintern <matthias.quintern(at)posteo.de>

pkgname=nextcloud-talk-desktop-bin
_pkgname=nextcloud-talk-desktop
pkgver=2.0.3
_pkgver=2.0.3
pkgrel=1
pkgdesc="Nextcloud Talk Desktop client based on Nextcloud Talk web application bundling"
arch=('x86_64')
url="https://github.com/nextcloud/talk-desktop"
license=('AGPL-3.0-only')
provides=('nextcloud-talk-desktop')

depends=()
optdepends=()
source=(Nextcloud.Talk-linux-x64-${_pkgver}-${pkgrel}.zip::https://github.com/nextcloud-releases/talk-desktop/releases/download/v${_pkgver}/Nextcloud.Talk-linux-x64.zip
        'nextcloud-talk.svg'
        'nextcloud-talk.png'
        'nextcloud-talk.desktop')
        # nextcloud-talk.svg::'https://github.com/nextcloud/talk-desktop/blob/main/img/talk-icon-rounded.svg'

        
sha256sums=('ee59a439c234c943fbc3b586bf5edf228cfbabd28a114cb1bc407cc746288385'
            'c657fd6071464318bc63ea09844470efc3d4210f179ed2deb8efee53052dac44'
            '8be5aed4243e7e25d46f41d68ebf7b3f85ebc4925e98391ad7e55fa98f2b83cb'
            '90d29341005410d944d5dd2c6339792d62126f3c865f8d7db86472d13902e884')

prepare() {
  # Avoid having a whitespace in the name of the binary
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
