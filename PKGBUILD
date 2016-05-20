# Maintainer: dreieck

_pkgname=idos-timetable-lang-en
pkgname="${_pkgname}"
epoch=0
pkgver=20160520
pkgrel=2
pkgdesc="English language ressource file for railway/ public transport timetable search engines by CHAPS."
arch=(any)
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-browser"
        )
makedepends=(
  "bdelta"
)
optdepends=()
provides=(
  "idos-timetable-lang=${pkgver}"
)
replaces=()
conflicts=()

source=(
  "ttakt.zip::http://ttakt.chaps.cz/TTAktual/Win/Zip/TTAKT.ZIP"
  "TTC-TTe.bdelta.xz"
  "copying.info.txt"
  "license_cc-nc-1.0.html"
)

sha256sums=(
  'SKIP'
  'f1d90ca684e053db7d35b85207b202b2c4b73315a7b864d849f599eb7b8fd1ee'
  '857ca643a994be4dc06ddf5423d66600a2d2ad26f0771d30819f27e2dfa5c002'
  '36c0b0466672bc90d9aa2219768f1ea1a72389cc63d89c4bb80bb4999628d8aa'
)

pkgver() {
  ls -L -l --time-style=+%Y%m%d "${srcdir}/TTC-TTe.bdelta.xz" | awk '{print $6}'
}

build() {
  cd "${srcdir}"
  
  echo "> bpatch TTC.dll TTe.dll TTC-TTe.bdelta"
  bpatch TTC.dll TTe.dll TTC-TTe.bdelta
}

package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"

  install -D -m644 "${srcdir}/TTe.dll" "${_instdir}/TTe.dll"
  install -D -m644 "${srcdir}/copying.info.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.info.txt"
  install -D -m644 "${srcdir}/license_cc-nc-1.0.html" "${pkgdir}/usr/share/licenses/${pkgname}/license_cc-nc-1.0.html"
}
