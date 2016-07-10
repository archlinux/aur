# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=gog-qfg2
pkgver=2.1.0.34
pkgrel=2
pkgdesc="Quest for Glory 2: Trial by Fire"
arch=('x86_64')
url="https://www.gog.com/game/quest_for_glory"
license=('custom')
depends=('dosbox' 'unionfs-fuse')
makedepends=('innoextract')
source=("local://setup_quest_for_glory2_${pkgver}.exe"
        "local://gog-qfg2.desktop"
        "local://run-qfg2.conf"
        "local://run-qfg2.sh")
sha256sums=('efda9c4ddd5753cbf39a25a3d90337f278ea11bd6c8f6352aab934c9d29a2796'
            '68e6421220d95d4440bfcbd29030133dada506476f11e92b74bd3439937a0ec6'
            'e8e28abd0667bce3d7fbcb66a814d8f445f1d012ee2b084a8e4a57e342900c6c'
            'e88ab7fe5da10ddf5e5b1cb68740a16b0406f942792daea91d8015916c1c8765')

prepare() {
  innoextract setup_quest_for_glory2_${pkgver}.exe
}

package() {
  mkdir -p "${pkgdir}/opt/gog"
  cp -R "${srcdir}/app" "${pkgdir}/opt/gog/qfg2"
  rm -rf "${pkgdir}/opt/gog/qfg2/DOSBOX"
  cp -R "run-qfg2.conf" "${pkgdir}/opt/gog/qfg2"
  cp -R "run-qfg2.sh" "${pkgdir}/opt/gog/qfg2"
  # Config file that tells game to use SB instead of Roland MIDI for music
  #cp -R "RESOURCE.CFG" "${pkgdir}/opt/gog/qfg2"

  mkdir -p "${pkgdir}/usr/share/applications"
  cp "gog-qfg2.desktop" "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
