_uuid_en="SCUS-94154"
_uuid_it="SCES-00967"
_uuid_jp="SCPS-10047"
_uuid=$_uuid_it
_app_id="com.naughtydog.CrashBandicoot2"
_title="Crash Bandicoot 2 - Cortex Strikes Back"
_rom_filename_it="${_title} (Europe) (En,Fr,De,Es,It) (EDC)"
_rom_filename_en="${_title} (USA)"
_rom_filename_jp="${_title} (Japan)"
pkgbase=crash-bandicoot-2
pkgname=("${pkgbase}"
         "${pkgbase}-de"
         "${pkgbase}-en"
         "${pkgbase}-es"
         "${pkgbase}-fr"
         "${pkgbase}-it"
         "${pkgbase}-jp")
pkgver=1.0
pkgrel=3
pkgdesc="1997 platform video game developed by Naughty Dog and published by Sony Computer Entertainment for the PlayStation."
arch=('any')
url="https://en.wikipedia.org/wiki/Crash_Bandicoot_2:_Cortex_Strikes_Back"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid_it}.bin::https://archive.org/download/redump.psx/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.bin"
        "${_uuid_it}.cue::https://archive.org/download/redump.psx/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28Europe%29%20%28En%2CFr%2CDe%2CEs%2CIt%29%20%28EDC%29.cue"
        "${_uuid_en}.bin::https://archive.org/download/Redump_PSX_2021_06_04_A_C/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28USA%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28USA%29.bin"
        "${_uuid_en}.cue::https://archive.org/download/Redump_PSX_2021_06_04_A_C/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28USA%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20Strikes%20Back%20%28USA%29.cue"
        "${_uuid_jp}.bin::https://archive.org/download/Redump_PSX_2021_06_04_A_C/Crash%20Bandicoot%202%20-%20Cortex%20no%20Gyakushuu%21%20%28Japan%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20no%20Gyakushuu%21%20%28Japan%29.bin"
        "${_uuid_jp}.cue::https://archive.org/download/Redump_PSX_2021_06_04_A_C/Crash%20Bandicoot%202%20-%20Cortex%20no%20Gyakushuu%21%20%28Japan%29.zip/Crash%20Bandicoot%202%20-%20Cortex%20no%20Gyakushuu%21%20%28Japan%29.cue"
        "psx-template.desktop"
	"launcher"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/e/e6/Crash_Bandicoot_2_Cortex_Strikes_Back_Game_Cover.jpg")
sha256sums=("9499b6ad8f0cfdb99ee8ae40bc98776f56fdaa91d01e55448f62aaa2c0df7853"
	    "6a4bf93ea6b904303254faa946d877cd705893c17458acb2549606dae586fd98"
	    "a2e2ab37cd6e0d5180876bf7786ac699b3b691208efe8de66afe7779bf4d1605"
	    "adbf5f4d9d32fbd68833a7d08e13a9cf3fb42459b7ddccb50e7b8fe76cb6760a"
	    "cbcf40d60cbce68068ee202ee1e0efa72cf3e7505446b5d0fb3a270f91562784"
	    "1b6c5951bf16c58953a44a927116f2d9d9fa0eefc88aadfc966bdfa7cda19d81"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "243e129901670aafd6c10384ba334af7ea7a2d8d7686ab94c50595318bec0a02"
	    "7cdc92303677967e8213e45934f2c5a45fa3a6b684dd01b8ecc5b03ba10e07b4")

prepare() {
  cp psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"

  cp launcher "${pkgbase}"
  sed -i "s/%_app_id%/${_app_id}/g" "${pkgbase}"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${pkgbase}"

  echo "/usr/games/${_app_id}/${_uuid}.cue" > any
  sed -i -e "s/${_rom_filename_en}/${_uuid_en}.bin/g" "${_uuid_en}.cue"
  sed -i -e "s/${_rom_filename_jp}/${_uuid_jp}.bin/g" "${_uuid_jp}.cue"
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

package_crash-bandicoot-2() {
  install -Dm644 any "${pkgdir}/usr/games/${_app_id}/any"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}

package_crash-bandicoot-2-en() {
  depends+=($pkgbase)
  local _lang="en"
  local _uuid="${_uuid_en}"
  _package "${_uuid}" "${_lang}"
}

package_crash-bandicoot-2-it() {
  depends+=($pkgbase)
  local _lang="it"
  local _uuid="${_uuid_it}"
  _package "${_uuid}" "${_lang}"
}

package_crash-bandicoot-2-de() {
  depends=("${pkgbase}-it")
  local _lang="de"
  local _uuid="${_uuid_de}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_crash-bandicoot-2-es() {
  depends=("${pkgbase}-it")
  local _lang="es"
  local _uuid="${_uuid_es}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_crash-bandicoot-2-fr() {
  depends=("${pkgbase}-it")
  local _lang="fr"
  local _uuid="${_uuid_fr}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_crash-bandicoot-2-jp() {
  depends+=($pkgbase)
  local _lang="jp"
  local _uuid="${_uuid_jp}"
  _package "${_uuid}" "${_lang}"
}
