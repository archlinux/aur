# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gog-qfg1
pkgver=2.1.0.33
pkgrel=3
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
            '10e4bbf6562aee29c3258d482fc482f43b7d5304e84da5a31204610a2bb7990d'
            '626dc2363536802d402e8f1144182dd3ba1eb39a103efbdaa6e95a078d025e95')

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
