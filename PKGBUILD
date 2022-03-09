_uuid="SCUS-94900"
_app_id="com.naughtydog.CrashBandicootE3"
_title="Crash Bandicoot (May 11, 1996 prototype)"
_rom_filename="Crash Bandicoot (c) 1996 Naughty Dog V3.44"
pkgname=crash-bandicoot-e3
pkgver=3.44
pkgrel=1
pkgdesc="A prototype of Crash Bandicoot for the Sony PlayStation."
arch=('any')
url="https://hiddenpalace.org/Crash_Bandicoot_(May_11,_1996_prototype)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.7z::https://files.hiddenpalace.org/c/c8/Crash_Bandicoot_%28May_11%2C_1996_prototype%29.7z"
        "psx-template.desktop"
        "${_app_id}.png::https://files.hiddenpalace.org/e/ea/CB_E3_DEMO.png")
sha256sums=("3084ce9b2decfe365abf8bd54c4d6d0f2b0257b8b3f2298aff0d3d8e68b08096"
	    "0e02de299792b54e399964867bf16cb37551ef7a5b1b42fcb9d1d1d7331f7550"
	    "4564d43794c766f33d38fdef54cdfd998c2ea6f111439dce1307e07c5fca8b73")

prepare() {
  local _game_path="${_title}/Crash Bandicoot (05-11-1996)"
  mv "${_game_path}/"*.{ccd,img,sub} ./

  mv psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"
  sed -i "s/%_uuid%/${_uuid}/g" "${_app_id}.desktop"
}

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_rom_filename}.ccd" "${_game}/${_uuid}.ccd"
  install -Dm644 "${_rom_filename}.img" "${_game}/${_uuid}.img"
  install -Dm644 "${_rom_filename}.sub" "${_game}/${_uuid}.sub"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
