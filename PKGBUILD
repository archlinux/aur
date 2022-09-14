#shellcheck disable=SC2034
_uuid="GPIP01"
_app_id="com.nintendo.Pikmin"
_title="Pikmin"
pkgname=pikmin
pkgver=1.0
pkgrel=2
pkgdesc="real-time strategy puzzle video game developed and published by Nintendo for the GameCube"
arch=('any')
url="https://en.wikipedia.org/wiki/Pikmin_(video_game)"
depends=('dolphin-emu')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid}.iso::https://archive.org/download/rr-nintendo-gamecube/europe/Pikmin%20%28E%29.7z/Pikmin%20%28E%29.iso"
        "gamecube-template.desktop"
        "${_app_id}.png::https://archive.ph/iMGvI/db3919adddaf0ceb42857428111bc97feefbe21d.jpg")
sha512sums=("8bf2fff81e1d3af10d35b287af26da4d26b40d183dc32d9adb1784576d6404d9903a13c1e56e68e662695c8e43349bb4656df18040b2a5d15893e4da377c30ce"
	    "64deb671d7251f9a97f82eb345799f5df8fa63fa1ebc8c8e1ee0c148af81ecdddfc85900be2957283507adc4fc90e78aef2723ad8b2f6c255d952c0b8ab29aa3"
	    "3b1ac4f8840bda750a73fc8eb33920c9c16f9ad837efadfac07e3b7156a4b8b353c3d702cd150f527270bbb2270a07270eda148fed561bf6aba31f6c584f9147")

prepare() {
  mv gamecube-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"
  sed -i "s/%_uuid%/${_uuid}/g" "${_app_id}.desktop"
}

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_uuid}.iso" "${_game}/${_uuid}.iso"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
