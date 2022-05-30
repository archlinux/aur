_uuid_en="SCUS-94228"
_uuid_it="SCES-01438"
_uuid_de="${_uuid_it}"
_uuid_es="${_uuid_it}"
_uuid_fr="${_uuid_it}"
_uuid_jp="SCPS-10085"
_uuid=$_uuid_en
_app_id="games.insomniac.SpyroTheDragon"
_title="Spyro The Dragon"
_rom_filename_en="${_title}"
_rom_filename_it="Spyro the Dragon (Europe) (En,Fr,De,Es,It)"
_rom_filename_jp="Spyro the Dragon (Japan)"
pkgbase=spyro-the-dragon
pkgname=($pkgbase $pkgbase-de $pkgbase-en $pkgbase-es $pkgbase-fr $pkgbase-it $pkgbase-jp)
pkgver=1.0
pkgrel=1
pkgdesc="Action-adventure hack and slash video game developed by SCE Cambridge Studio and published by Sony Computer Entertainment for the PlayStation."
arch=('any')
url="https://en.wikipedia.org/wiki/MediEvil"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid_en}.bin::https://archive.org/download/SpyroTheDragon.7z/Spyro%20the%20Dragon.7z/Spyro%20the%20Dragon.bin"
	"${_uuid_en}.cue::https://archive.org/download/SpyroTheDragon.7z/Spyro%20the%20Dragon.7z/Spyro%20the%20Dragon.cue"
	"${_uuid_it}.7z::https://archive.org/download/spyro-the-dragon-europe-en-fr-de-es-it.-7z/Spyro%20the%20Dragon%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29.7z"
	"${_uuid_jp}.7z::https://archive.org/download/sonyplaystationasiantscj20151103/Spyro%20the%20Dragon%20%28Japan%29.7z"
        "psx-template.desktop"
	"launcher"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/5/53/Spyro_the_Dragon.jpg")
sha256sums=("fc866b2a02e010a6658f8af2de28bb3001eb33513e5924af014e35643c6dee37"
	    "e34a77b4d0c0d85c409db3dac96546020b57af163b532bfb279ba99b05c3f133"
	    "bb1e93b0273e9cbe1e61d519b4cab7f91826fdf69cb64dadbbeca117ff6e79cb"
	    "1a5ac315868c1a34105965747e7cb82960cfd390dd28f786cc045c502cdeb4a2"
	    "517b82624fe3f0ea13ca4f9eea1e11088e30ff8449ae69f37b7a1412744c734d"
	    "243e129901670aafd6c10384ba334af7ea7a2d8d7686ab94c50595318bec0a02"
	    "19b03ed9e69ce0f4815c87e80dcf78aa61a2e8e10c17f3a4106599f5d1774646")

prepare() {
  cp psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"

  cp launcher "${pkgbase}"
  sed -i "s/%_app_id%/${_app_id}/g" "${pkgbase}"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${pkgbase}"

  mv "${_rom_filename_jp}.bin" "${_uuid_jp}.bin"
  mv "${_rom_filename_it}.bin" "${_uuid_it}.bin"
  cp "${_uuid_en}.cue" "${_uuid_jp}.cue"
  cp "${_uuid_en}.cue" "${_uuid_it}.cue"

  echo "/usr/games/${_app_id}/${_uuid}.cue" > any
  sed -i -e "s/${_rom_filename_en}/${_uuid_en}.bin/g" "${_uuid_en}.cue"
  sed -i -e "s/${_rom_filename_en}/${_uuid_jp}.bin/g" "${_uuid_jp}.cue"
  sed -i -e "s/${_rom_filename_it}/${_uuid_it}.bin/g" "${_uuid_it}.cue"
}

_package(){
  local _uuid="${1}"
  local _lang="${2}"
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm644 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm644 "${_uuid}.sbi" "${_game}/${_uuid}.sbi" || true
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${_game}/${_lang}"
}

package_spyro-the-dragon() {
  install -Dm644 any "${pkgdir}/usr/games/${_app_id}/any"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}

package_spyro-the-dragon-en() {
  depends+=($pkgbase)
  local _lang="en"
  local _uuid="${_uuid_en}"
  _package "${_uuid}" "${_lang}"
}

package_spyro-the-dragon-it() {
  depends+=($pkgbase)
  local _lang="it"
  local _uuid="${_uuid_it}"
  _package "${_uuid}" "${_lang}"
}

package_spyro-the-dragon-de() {
  depends=("${pkgbase}-it")
  local _lang="de"
  local _uuid="${_uuid_de}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_spyro-the-dragon-es() {
  depends=("${pkgbase}-it")
  local _lang="es"
  local _uuid="${_uuid_es}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_spyro-the-dragon-fr() {
  depends=("${pkgbase}-it")
  local _lang="fr"
  local _uuid="${_uuid_fr}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_spyro-the-dragon-jp() {
  depends+=($pkgbase)
  local _lang="jp"
  local _uuid="${_uuid_jp}"
  _package "${_uuid}" "${_lang}"
}
