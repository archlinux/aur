# Maintainer: dreieck

## `PKGBUILD` last updated: >= 2023-11-20.

url="https://chaps.cz/eng/download/idos/zip#kotvainf"
_zipfile="C1.ZIP"
_pkgname=idos-timetable-additionalinfo-chaps-trains
pkgname="${_pkgname}-2022"
epoch=0
_pkgver='2022_04_05'
pkgver="${_pkgver}"
pkgrel=3
pkgdesc="Links for additional information on Czech trains and railway stations, to be used with the timetable search engines by CHAPS. Data from 2022."
arch=('any')
license=('custom')

groups=(
        "idos-timetable"
       )
depends=(
         "idos-timetable-data-trains-cz"
        )

makedepends=(
  "wget"
)

optdepends=()

replaces=(
  "${_pkgname}-latest<2023" # In 2023, this data seems to have vanished from `https://chaps.cz/eng/download/idos/zip#kotvainf`. So this package here is to replace the `-latest` package which is deprecated and is about to be deleted.
)

options+=('!strip')

provides=(
  "${_pkgname}=${pkgver}"

  "idos-timetable-additionalinfo-trains=${pkgver}"

  "idos-timetable-additionalinfo-trains-cz=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_target="c1-${_pkgver}.zip"

source=(
  "${_target}::http://web.archive.org/web/20220405204613/http://ttakt.chaps.cz/TTAktual/Win/Zip/${_zipfile}"
  "IDOS-Licence.pdf::http://web.archive.org/web/20210904102649/http://www.chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  '1fe20538307d911d6edcec6590da51bf782cda64877f7dfabe742f11f618a657'
  "SKIP"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 755 "${_instdir}"/Data*/*
  chmod 644 "${_instdir}"/Data*/*/*

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
