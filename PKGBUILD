_uuid="SCES-00967"
_app_id="com.naughtydog.CrashBandicoot2E3"
_title="Crash Bandicoot 2 - Cortex Strikes Back (Jun 15, 1997)"
_rom_filename="crash2_v2_ntsc"
pkgname=crash-bandicoot-2-e3
pkgver=1.0
pkgrel=2
pkgdesc="An early prototype of Crash Bandicoot 2: Cortex Strikes Back for the PlayStation. "
arch=('any')
url="https://hiddenpalace.org/Crash_Bandicoot_2:_Cortex_Strikes_Back_(Jun_15,_1997_prototype)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.7z::https://files.hiddenpalace.org/f/fb/Crash_Bandicoot_2_Cortex_Strikes_Back_%28Jun_15%2C_1997_prototype%29.7z"
        "psx-template.desktop"
        "${_app_id}.png::https://files.hiddenpalace.org/3/3a/Crash2-Jun15-1.png")
sha256sums=("f24d4864b5bd5db053fce90ad9fa3487f0519e88c0f7d764d9e3aed3df165b7a"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "33bc90d5f1a7c606c59d076acea0263b5f28116eb50a65f30707c3536187c685")

prepare() {
  local _game_path="Crash_Bandicoot_2_Cortex_Strikes_Back_(Jun_15,_1997_prototype)/Crash2-1997-06-15"
  mv "${_game_path}"/* ./

  mv psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"
  sed -i "s/%_uuid%/${_uuid}/g" "${_app_id}.desktop"
}

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_rom_filename}.c2" "${_game}/${_uuid}.c2"
  install -Dm644 "${_rom_filename}.cue" "${_game}/${_uuid}.cue"
  install -Dm644 "${_rom_filename}.bin" "${_game}/${_uuid}.bin"
  install -Dm644 "${_rom_filename}.dat" "${_game}/${_uuid}.dat"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
