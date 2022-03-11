_uuid="SLES-01587"
_app_id="com.easports.FIFA99"
_title="FIFA 99"
_rom_filename="${_title} (Italy)"
pkgname=fifa-99
pkgver=1.0
pkgrel=2
pkgdesc="Football simulation video game developed by EA Canada and published by Electronic Arts under the EA Sports label."
arch=('any')
url="https://en.wikipedia.org/wiki/FIFA_99"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/FIFA%2099%20%28Italy%29.zip/FIFA%2099%20%28Italy%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/FIFA%2099%20%28Italy%29.zip/FIFA%2099%20%28Italy%29.cue"
        "psx-template.desktop"
        "${_app_id}.png::https://psxdatacenter.com/images/covers/P/F/SLES-01587.jpg")
sha256sums=("8c718bfeb4c179a97e7277f60344702a6881ff8542260056cd570caeab1721b4"
	    "d90d104740d4dbdef23b4de55e5847dc7d38512a6b10391ef330cd91dc323880"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "45d0beaaff4f53f7e148ddff0ef79123d4b68b2e25eef7270cfe748a7f72434d")

prepare() {
  mv psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"
  sed -i "s/%_uuid%/${_uuid}/g" "${_app_id}.desktop"

  sed -i -e "s/${_rom_filename}/${_uuid}/g" "${_uuid}.cue"
}

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm644 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
