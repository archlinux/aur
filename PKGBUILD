_uuid_ita="SCES-02545"
_app_id="net.worldwidestudios.MediEvil2"
_title="MediEvil 2"
_rom_filename_ita="${_title} (E) (Es,It,Pt)"
pkgbase=medievil-2
pkgname=($pkgbase-ita $pkgbase-es $pkgbase-pt)
pkgver=1.0
pkgrel=1
pkgdesc="Action-adventure hack and slash video game developed by SCE Cambridge Studio and published by Sony Computer Entertainment for the PlayStation."
arch=('any')
url="https://en.wikipedia.org/wiki/MediEvil_2"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid_ita}.7z::https://archive.org/download/medievil2-portugal-spain-italy-ps1/MediEvil%202%20%28Es%2C%20It%2C%20Pt%29%20%28PS1%29.7z"
	"${_uuid_ita}.sbi.7z::https://psxdatacenter.com/sbifiles/MediEvil%202%20(S)(I)(P)%20[SCES-02545]%20sbi.7z"
        "psx-template.desktop"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/f/f2/MediEvil_2_Cover.jpg")
sha256sums=("9741f923a8581ffeb4b2bffe1ee4f95bc1bfb7636040915c4889e9fde02cbe3f"
	    "396cf29bb413f5f537a5446c6b29898907b64875dfb658f1358ebbd18da18f40"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "64beb960bff7c8b2e58d731d84053d2b36bf98a41fa0d0781ef37c1a271bae97")

prepare() {
  mv "${_rom_filename_ita}.bin" "${_uuid_ita}.bin"
  mv "${_rom_filename_ita}.cue" "${_uuid_ita}.cue"
  mv psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"

  sed -i -e "s/${_rom_filename_ita}/${_uuid_ita}/g" "${_uuid_ita}.cue"
}

_package(){
  local _uuid="${1}"
  local _game="${pkgdir}/usr/games/${_app_id}"
  sed -i "s/%_uuid%/${_uuid}/g" "${_app_id}.desktop"
  install -Dm644 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm644 "${_uuid}.sbi" "${_game}/${_uuid}.sbi"
  install -Dm644 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}

package_medievil-2-ita() {
  provides=('medievil-2'
            'medievil-2-es'
            'medievil-2-pt')
  local _uuid="${_uuid_ita}"
  mv "SCES_025.45.sbi" "${_uuid}.sbi"
  _package "${_uuid}"
}

package_medievil-2-es() {
  provides=('medievil')
  depends=('medievil-2-ita')
}

package_medievil-2-pt() {
  provides=('medievil')
  depends=('medievil-2-ita')
}
