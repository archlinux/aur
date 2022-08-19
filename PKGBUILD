# Maintainer: robertfoster

pkgname=iortcw-venom-mod
pkgver=6.8u
pkgrel=1
pkgdesc="A general improvement of original RTCW game, with a new challenging and aggressive AI, keeping the original gameplay"
arch=(any)
url="https://www.moddb.com/mods/rtcw-venom-mod"
license=('CUSTOM')
depends=('iortcw' 'iortcw-data')
makedepends=('unzip')
noextract=("${pkgname}-${pkgver}.zip")

_mainid=173653
_itaid=224261

PKGEXT='.pkg.tar'
DLAGENTS+=("moddb::${BASH_SOURCE[0]%/*}/moddb-downloader.sh %u %o")

source=("${pkgname}-${pkgver}.zip::moddb://www.moddb.com/downloads/start/${_mainid}/all"
  "${pkgname}-ita-${pkgver}.zip::moddb://www.moddb.com/downloads/start/${_itaid}/all"
  moddb-downloader.sh
)
_itapath="/opt/iortcw/italian"
_moditapath="/opt/iortcw/venom-mod-italian"
_modpath="/opt/iortcw/venom-mod"

package() {
  # Vanilla with Italian localization
  mkdir -p "${pkgdir}${_itapath}"

  # Venom Mod with Italian localization
  mkdir -p "${pkgdir}${_moditapath}"

  # Venom Mod
  mkdir -p "${pkgdir}${_modpath}"

  # Unzipping with flattened paths
  unzip -jo "${pkgname}-${pkgver}.zip" -d "${pkgdir}${_modpath}"
  unzip -jo "${pkgname}-ita-${pkgver}.zip" -d "${pkgdir}${_itapath}"

  # Make Venom Mod available in Italian
  ln -s -r "${_modpath}/mp_vpak6.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_modpath}/mp_vpak7.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_modpath}/mp_vpak8.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_modpath}/sp_vpak5.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_modpath}/sp_vpak6.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_modpath}/sp_vpak7.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_modpath}/sp_vpak8.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_modpath}/z_pak1.pk3" \
    "${pkgdir}${_moditapath}"

  ln -s -r "${_itapath}/mp_pak1.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_itapath}/mp_pak3.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_itapath}/mp_pak5.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_itapath}/sp_pak1.pk3" \
    "${pkgdir}${_moditapath}"
  ln -s -r "${_itapath}/sp_pak3.pk3" \
    "${pkgdir}${_moditapath}"

  # Clean unneeded files
  find "${pkgdir}${_itapath}" -type f \
    ! -iname "*.pk3" \
    ! -iname "*.cfg" -exec rm {} \;
}

sha256sums=('f353639595dbae36e506547015b18dffcf8e057928f83406afe51af846fcc08d'
            '877a4a19d80deda2e4a05022f1b63ba39c4d6a1c960757bd8a969595be5164ba'
            '6482482e637d38ce6eff6ab740f971f86b7e0d205797b2c5044aecfcf5701364')
