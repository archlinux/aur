_uuid="SCES-00344"
_app_id="com.naughtydog.CrashBandicoot"
_title="Crash Bandicoot"
_rom_filename="${_title} (Europe) (EDC)"
pkgname=crash-bandicoot
pkgver=1.0
pkgrel=3
pkgdesc="1996 platform video game developed by Naughty Dog and published by Sony Computer Entertainment for the PlayStation."
arch=('any')
url="https://en.wikipedia.org/wiki/Crash_Bandicoot_(video_game)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.bin::https://archive.org/download/redump.psx/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.zip/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.bin"
	"${_uuid}.cue::https://archive.org/download/redump.psx/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.zip/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.cue"
        "psx-template.desktop"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/4/44/Crash_Bandicoot_Cover.png")
sha256sums=("a086b6fdd8d908393ff8a7e29be1e7add7cc0a495a221f526c6aa0e784329a54"
	    "866e0e0e9450d605b2b906a069ec74e2d51131fbd65f13d03462943f685bd51e"
	    "9ad40ca67c657bf4340be69d7aeba0df93b7f7805599b619efe422ec6fc5c49d"
	    "7cdc92303677967e8213e45934f2c5a45fa3a6b684dd01b8ecc5b03ba10e07b4")

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
