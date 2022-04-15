_uuid="SLPM-86424"
_app_id="jp.co.taito.DenshaDeGoNagoyaRailroad"
_title="Densha de Go! Nagoya Railroad"
_rom_filename="${_title} (Japan)"
pkgname=densha-de-go-nagoya-railroad
pkgver=1.0
pkgrel=3
pkgdesc="2000 train simulator arcade game developed and published by Taito in Japan."
arch=('any')
url="https://en.wikipedia.org/wiki/Densha_de_Go!_(video_game)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/Densha%20de%20Go%21%20Nagoya%20Tetsudou-hen%20%28Japan%29.zip/Densha%20de%20Go%21%20Nagoya%20Tetsudou-hen%20%28Japan%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/Densha%20de%20Go%21%20Nagoya%20Tetsudou-hen%20%28Japan%29.zip/Densha%20de%20Go%21%20Nagoya%20Tetsudou-hen%20%28Japan%29.cue"
        "psx-template.desktop"
        "${_app_id}.png::https://psxdatacenter.com/images/covers/J/D/SLPM-86424.jpg")
sha256sums=("4434db34de96feabcd780c5c272526924589d1e7a36d52d6a675cfcb8f4b6cf3"
	    "4a85db48de80c4b717a79c1d46931c1601c3196f7cb9d897e7b83a08ff7b2339"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "ca6e24ac03284f69a3456b1fce4ce0fa04e051f120eb358c4bb0baa208cb2fea")

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
