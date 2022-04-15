_uuid="SLES-00975"
_app_id="com.capcom.ResidentEvil2Leon"
_title="Resident Evil 2: Leon"
_rom_filename="${_title} (Italy) (Disc 1) (Leon Disc)"
pkgname=resident-evil-2-leon-ita
pkgver=1.0
pkgrel=1
pkgdesc="1998 survival horror video game developed and published by Capcom for the PlayStation (Italian version)."
arch=('any')
url="https://en.wikipedia.org/wiki/Resident_Evil_2"
depends=('duckstation')
makedepends=('binmerge')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid} (Track 1).bin::https://archive.org/download/resident-evil-2-ps1/Resident%20Evil%202%20%28Italy%29%20%28Disc%201%29%20%28Leon%20Disc%29.7z/Resident%20Evil%202%20%28Italy%29%20%28Disc%201%29%20%28Leon%20Disc%29%20%28Track%201%29.bin"
	"${_uuid} (Track 2).bin::https://archive.org/download/resident-evil-2-ps1/Resident%20Evil%202%20%28Italy%29%20%28Disc%201%29%20%28Leon%20Disc%29.7z/Evil%202%20%28Italy%29%20%28Disc%201%29%20%28Leon%20Disc%29%20%28Track%202%29.bin"
	"${_uuid}.cue"
        "psx-template.desktop"
        "${_app_id}.png::https://static.wikia.nocookie.net/residentevil/images/d/db/Bio2_PS.jpg")
sha256sums=("ce75c6261f4965ce3c40a23c77d026832b39233857568f1705101840bb76c0d9"
	    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
	    "cc656cbc10cf90116b7f5febf13f490678ec491fe5bf4ff7e03215ec87ad69cb"
	    "fdfbc31089c3e1b63e92ff58618262b72d1f8baba11a1688f0b8ab3a932d70c6"
	    "0ba0656513456cd6c05106e9608fce278f3c43a9ef76daa8c735e33c29fcfefb")

prepare() {
  mv psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"
  sed -i "s/%_uuid%/${_uuid}/g" "${_app_id}.desktop"

  mkdir temp
  binmerge "${_uuid}.cue" "${_uuid}" -o "temp"
  mv "temp/${_uuid}.bin" ./
  mv "temp/${_uuid}.cue" ./
}

package() {
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm644 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
}
