_uuid="SCES-00967"
_app_id="com.naughtydog.CrashBandicoot2"
_title="Crash Bandicoot 2 - Cortex Strikes Back"
_rom_filename="${_title} (Europe) (En,Fr,De,Es,It) (EDC)"
pkgname=crash-bandicoot-2
pkgver=1.0
pkgrel=2
pkgdesc="1997 platform video game developed by Naughty Dog and published by Sony Computer Entertainment for the PlayStation."
arch=('any')
url="https://en.wikipedia.org/wiki/Crash_Bandicoot_2:_Cortex_Strikes_Back"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.cue"
        "psx-template.desktop"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/e/e6/Crash_Bandicoot_2_Cortex_Strikes_Back_Game_Cover.jpg")
sha256sums=("9499b6ad8f0cfdb99ee8ae40bc98776f56fdaa91d01e55448f62aaa2c0df7853"
	    "6a4bf93ea6b904303254faa946d877cd705893c17458acb2549606dae586fd98"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "25672f46b68b4108344292ca5265bc78394ddbc39f3431d2fae6d4bccf8e2773")

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
