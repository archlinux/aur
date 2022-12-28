_uuid="SLPS-02805"
_app_id="com.bandai.PunchTheMonkeyGameEdition"
pkgname="punch-the-monkey"
_rom_title="Punch the Monkey! Game Edition"
_title="Lupin The 3rd - ${_rom_title}"
_rom_filename="${_rom_title} (Japan)"
pkgver=1.0
pkgrel=1
pkgdesc="Video game developed by Bandai and published by Sony Computer Entertainment for the PlayStation in 2000."
arch=('any')
url="https://en.wikipedia.org/wiki/List_of_Lupin_the_Third_video_games"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.7z::https://archive.org/download/rr-sony-playstation-j/japan/Punch%20the%20Monkey%21%20Game%20Edition%20%28Japan%29.7z"
        "psx-template.desktop"
        "${_app_id}.png::https://www.gamerclick.it/images/serie/PunchTheMonkeyGameEdition/PunchTheMonkeyGameEdition-cover.jpg")
sha256sums=("66130d8e10900e6244da209e91391e0ab85db46bba2d54c72aaa03be45c36d7b"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "fa9e3bf909d73b0075495eb99488ee20e786d9be956da5a108c2e1f79207ab46")

prepare() {
  mv psx-template.desktop "${_app_id}.desktop"
  mv "${_rom_filename} (Track 1).bin" "${_uuid} (Track 1).bin"
  mv "${_rom_filename} (Track 2).bin" "${_uuid} (Track 2).bin"
  mv "${_rom_filename} (Track 3).bin" "${_uuid} (Track 3).bin"
  mv "${_rom_filename} (Track 4).bin" "${_uuid} (Track 4).bin"
  mv "${_rom_filename}.cue" "${_uuid}.cue"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"
  sed -i "s/%_uuid%/${_uuid}/g" "${_app_id}.desktop"

  sed -i -e "s/${_rom_filename}/${_uuid}/g" "${_uuid}.cue"
}

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_uuid} (Track 1).bin" "${_game}/${_uuid} (Track 1).bin"
  install -Dm644 "${_uuid} (Track 2).bin" "${_game}/${_uuid} (Track 2).bin"
  install -Dm644 "${_uuid} (Track 3).bin" "${_game}/${_uuid} (Track 3).bin"
  install -Dm644 "${_uuid} (Track 4).bin" "${_game}/${_uuid} (Track 4).bin"
  install -Dm644 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
