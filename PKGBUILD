# Maintainer: robertfoster; keshavnrj

pkgname=orion-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful, lightweight, fast BitTorrent client, with beautiful user experience and fastest video and audio streaming capabilities"
arch=('x86_64')
url="https://snapcraft.io/orion-desktop"
license=('PROPRIETARY')
options=('!strip')
depends=(
  'nodejs-lts-gallium'
  'qt5-base'
  'qt5-webkit'
  'mpv'
)
makedepends=('squashfs-tools' 'jq')
sha256sums=('e0eb2810bb4398cb7f27b6fc5f8da969e6d820fb01638a634b382ea9374a4c06'
            '25f7ceaaec37eb9c287abeb839ba2036738eb363079e321c2bd410fa48301dd6'
            '71420954985d07f63c8195d5e6ff12c55ac366d99fd3024846bbdc8463af2579'
            '4991a25e728da947d59c31d9a790f2edaf04ae073bd267ea2ffcf519fe12f274')

DLAGENTS+=("snap::${BASH_SOURCE[0]%/*}/snap-dlagent.sh %u %o")
source=("${pkgname}-${pkgver}.squashfs::snap://api.snapcraft.io/v2/snaps/info/orion-desktop"
  snap-dlagent.sh
  "${pkgname}.desktop"
  "${pkgname}.sh"
)

prepare() {
  cd "${srcdir}"

  msg2 "Extraction..."
  unsquashfs ${pkgname}-${pkgver}.squashfs
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/opt/"
  cp -r squashfs-root "${pkgdir}/opt/${pkgname}"
  install -Dm755 orion-desktop.sh \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 squashfs-root/meta/gui/icon.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
