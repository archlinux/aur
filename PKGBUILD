_uuid="81210"
_app_id="com.sega.ManxTTSuperBike"
pkgname=manx-tt-superbike
pkgver=1.0
pkgrel=1
pkgdesc="Arcade game."
arch=('any')
url="https://en.wikipedia.org/wiki/Manx_TT_Super_Bike"
depends=('kronos')
makedepends=("unzip" "p7zip")
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("M.zip::https://archive.org/download/SegaSaturnChampionCollection/M.zip"
        "${_app_id}.desktop"
        "${_app_id}.png")
sha256sums=("4e3acc78f0621998442363a6cd482256279c5ce7d1f8eaf781cc217285b28f9a"
	    "bc1c69e001e251c0ab413cf5c3a2d2bc399c0b1acb07870d847b1ccc77d95f82"
	    "ea721774cfd5c10b8b1658051d87650567bd1b96dfbfaabe33500949ea8cfce7")

package() {
  local _bin
  local _game="${pkgdir}/usr/games/${_app_id}"
  local _title="Manx TT SuperBike"
  local _filename="${_title} (USA)"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"

  7z x -y -o"${pkgname}" "${_title}.7z"

  cd ${pkgname}
  
  sed -i -e "s/${_filename}/${_uuid}/g" "${_filename}.cue"

  for _bin in *; do
    _dest=${_bin/$_filename/$_uuid}
    install -Dm644 "${_bin}" "${_game}/${_dest}"
  done
}
