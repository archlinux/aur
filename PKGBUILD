# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gog-qfg1
pkgver=2.1.0.33
pkgrel=1
pkgdesc="Quest for Glory 1: So You Want to Be a Hero"
arch=('x86_64')
url="https://www.gog.com/game/quest_for_glory"
license=('custom')
depends=('dosbox' 'unionfs-fuse')
makedepends=('innoextract')
source=("local://setup_quest_for_glory_vga_2.1.0.33.exe"
        "local://RESOURCE.CFG"
        "local://gog-qfg1.desktop"
        "local://run-qfg1.conf"
        "local://run-qfg1.sh")
sha256sums=('728aec4488c22aa43be8a362f9100b6fa63e14bf492aacb70d088199f4baf0f0'
            '81af12e1292b6ef70ea03a8dbfd42ee7ade79da36a7ebfa5765ed3baa4809a2d'
            '80baf0c3984902d4e7b3a1e4b1c76e3bf3fa1f7077de6c0c21b9ab1a406a85bc'
            '1fed72d017ec186e00bc386da0d1044b0088e4a09f6a6f725756cb79ff6529c3'
            '6324d9de9f8dc4a15211cbe3d0e4dfe58ae0bf47dbb29778c59928fe084eceb6')

prepare() {
  innoextract setup_quest_for_glory_vga_2.1.0.33.exe
}

package() {
  mkdir -p "${pkgdir}/opt/gog"
  cp -R "${srcdir}/app" "${pkgdir}/opt/gog/qfg1"
  rm -rf "${pkgdir}/opt/gog/qfg1/DOSBOX"
  cp -R "run-qfg1.conf" "${pkgdir}/opt/gog/qfg1"
  cp -R "run-qfg1.sh" "${pkgdir}/opt/gog/qfg1"
  # Config file that tells game to use SB instead of Roland MIDI for music
  cp -R "RESOURCE.CFG" "${pkgdir}/opt/gog/qfg1"

  mkdir -p "${pkgdir}/usr/share/applications"
  cp "gog-qfg1.desktop" "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
