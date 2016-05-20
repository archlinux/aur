# Maintainer: dreieck

_pkgname=idos-timetable-lang-en
pkgname="${_pkgname}"
epoch=0
pkgver=20160520
pkgrel=1
pkgdesc="English language ressource file for railway/ public transport timetable search engines by CHAPS."
arch=('i686' 'x86_64')
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
  "licence_cc-nc-sa-1.0.html"
)

sha256sums=(
  'SKIP'
  'f1d90ca684e053db7d35b85207b202b2c4b73315a7b864d849f599eb7b8fd1ee'
  '0959ebb3373999b08742d91379a674264286ab9c538c4e3f7605e3ca012a258b'
  '66abb860546e55d992279b9a170713cea64c963a501ee5e947a2c675d6d1388b'
)

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
  install -D -m644 "${srcdir}/licence_cc-nc-sa-1.0.html" "${pkgdir}/usr/share/licenses/${pkgname}/licence_cc-nc-sa-1.0.html"
}
