_uuid="SCPS-45167"
_app_id="jp.co.taito.DenshaDeGo"
_title="Densha de Go!"
_rom_filename="${_title} (Japan)"
pkgname=densha-de-go
pkgver=1.0
pkgrel=3
pkgdesc="1997 train simulator arcade game developed and published by Taito in Japan."
arch=('any')
url="https://en.wikipedia.org/wiki/Densha_de_Go!_(video_game)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/Densha%20de%20Go%21%20%28Japan%29.zip/Densha%20de%20Go%21%20%28Japan%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/Densha%20de%20Go%21%20%28Japan%29.zip/Densha%20de%20Go%21%20%28Japan%29.cue"
        "psx-template.desktop"
        "${_app_id}.png::https://psxdatacenter.com/images/covers/J/D/SCPS-45167.jpg")
sha256sums=("2d39b81014a3505ad6d944c2b1bb26bd180831969080c5ce0fc3b638a37607d7"
	    "f2194478004413c87ad4c565cf46380cd71cd5d14cb53f5ef35ca105484b5a22"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "58de1946ff228ca0001582a1a4787039d160b5ad592b332dda5087a5412007f1")

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
