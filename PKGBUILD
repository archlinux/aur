_uuid="SCUS-94426"
_app_id="com.naughtydog.CrashTeamRacing"
_title="CTR - Crash Team Racing"
_rom_filename="${_title} (USA)"
pkgname=crash-team-racing
pkgver=1.0
pkgrel=3
pkgdesc="1999 kart racing video game developed by Naughty Dog and published by Sony Computer Entertainment for the PlayStation."
arch=('any')
url="https://en.wikipedia.org/wiki/Crash_Team_Racing"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/CTR%20-%20Crash%20Team%20Racing%20%28USA%29.zip/CTR%20-%20Crash%20Team%20Racing%20%28USA%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/CTR%20-%20Crash%20Team%20Racing%20%28USA%29.zip/CTR%20-%20Crash%20Team%20Racing%20%28USA%29.cue"
        "psx-template.desktop"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/4/4f/CrashTeamRacingNACover.png")
sha256sums=("f780bf2331476aabfc00772fa758b12dd95ebfbc907968132cbd3cdd4e2c07c0"
	    "5bac7f02de7b8fb081e1049f4a277be1062c83fcb7ac6c98308ba7985280e4c3"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "35407861e9f0adc6a02f5c2123e4118328603876ca99285e7a98087ee1be3273")

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
