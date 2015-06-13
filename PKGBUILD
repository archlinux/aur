# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgbase=ultravnc-viewer-i18n
pkgname=()
pkgver=1.1.8.0
pkgrel=1
arch=('any')
url="http://www.uvnc.com"
license=('GPL')
depends=("ultravnc-viewer")
provides=("${pkgbase}")
conflicts=("${pkgbase}")
source=("Uvnc_translations-${pkgver}.zip"::"http://support1.uvnc.com/download/${pkgver//./}/translations.zip")
sha256sums=('77b442c4d911be9e34bd50c6aad7ec50cef8368d8e3d8f59e312385e3896c34d')
_languages=(
  'ca  Catalan     catalan'
  'de  German      german'
  'fr  French      french'
  'ja  Japanese    japanese'
  'pt  Portuguese  portugueze'
  'ru  Russian     russian'
  'es  Spanish     spanish'
)

_package() {
  _filename="$1"

  install -m 755 -d "${pkgdir}/usr/lib/ultravnc-viewer/"
  install -m 644 "translated_viewers/${_filename}.dll" "${pkgdir}/usr/lib/ultravnc-viewer/vnclang.dll"
}

for _lang in "${_languages[@]}"
do
  _langarray=(${_lang})
  _pkgname="${pkgbase}-${_langarray[0]}"

  pkgname+=("${_pkgname}")
  eval "package_${_pkgname}() {
    pkgdesc='${_langarray[1]} translation for UltraVNC Viewer'
    _package ${_langarray[2]}
  }"
done

