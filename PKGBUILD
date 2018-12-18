# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2017-12-17.

_pkgname=idos-timetable-maps-chaps-all
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2018_12_10
pkgrel=1
pkgdesc="Map data for the timetable search engines by CHAPS: European railway, Czech/Slovak trains + bus, Czech public transport. Note that some timetables need the purchased version of IDOS to run."
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvamap"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=("idos-timetable-data")

makedepends=(
  "wget"
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-maps=${pkgver}"
  "idos-timetable-maps-trains=${pkgver}"
  "idos-timetable-maps-bus=${pkgver}"
  "idos-timetable-maps-mhd=${pkgver}"
  "idos-timetable-maps-mhd-cz=${pkgver}"
  
  "idos-timetable-maps-trains-cz=${pkgver}"
  "idos-timetable-maps-trains-sk=${pkgver}"
  "idos-timetable-maps-trains-europe=${pkgver}"
  
  "idos-timetable-maps-bus-cz=${pkgver}"
  "idos-timetable-maps-bus-sk=${pkgver}"
  
  "idos-timetable-maps-mhd-idsjmk=${pkgver}"
  "idos-timetable-maps-mhd-ceskebudejovice=${pkgver}"
  "idos-timetable-maps-mhd-jihlava=${pkgver}"
  "idos-timetable-maps-mhd-olomouc=${pkgver}"
  "idos-timetable-maps-mhd-odis=${pkgver}"
  "idos-timetable-maps-mhd-pid=${pkgver}"
  "idos-timetable-maps-mhd-trebic=${pkgver}"
  "idos-timetable-maps-mhd-ustinl=${pkgver}"
  "idos-timetable-maps-mhd-zlin=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  
  "idos-timetable-maps-chaps-trains-europe"
  "idos-timetable-maps-chaps-trains-cz"
  "idos-timetable-maps-chaps-trains-sk"
  "idos-timetable-maps-bus-cz"
  "idos-timetable-maps-bus-sk"
  "idos-timetable-maps-mhd-idsjmk"
  "idos-timetable-maps-mhd-ceskebudejovice"
  "idos-timetable-maps-mhd-jihlava"
  "idos-timetable-maps-mhd-olomouc"
  "idos-timetable-maps-mhd-odis"
  "idos-timetable-maps-mhd-pid"
  "idos-timetable-maps-mhd-trebic"
  "idos-timetable-maps-mhd-ustinl"
  "idos-timetable-maps-mhd-zlin"
)

_target='komplet_m.zip'

source=(
  "${_target}::http://ttakt.chaps.cz/TTAktual/Win/Zip/KOMPLET_M.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "SKIP"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File KOMPLET_M.ZIP\(.*\)Zip/KOMPLET_M.ZIP.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
