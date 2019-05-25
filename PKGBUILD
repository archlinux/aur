# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2019-05-25.

_pkgname=idos-timetable-browser-license
pkgname="${_pkgname}"
epoch=1
_pkgver=2017_2018
pkgver="${_pkgver}"
pkgrel=4
pkgdesc="If you purchased IDOS for Windows by CHAPS, then this installs the license. You need your setup-code during installation."
arch=('i686' 'x86_64')
url="http://www.chaps.cz/eng/order"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
  "idos-timetable-browser"
)

makedepends=()

optdepends=()

provides=()

conflicts=(
  "idos-timetable-browser-license-installer"
)

source=(
  "TT.ttk.prefix"
  "TT.ttk.suffix"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "copying.txt"
  "idos-timetable-browser-license.install"
)

sha256sums=(
  "c002d46e50509049428fe46193acbeb2e2265dadb2b6d0fdb52dc2a3ed83a18e"
  "59d379168865a4a88a697e55b2a1af342f6631cea6278ef05c98ff0c755ea0ab"
  "SKIP"
  "6382fff14035c4ec7387e7f0d20d7494e05da3d4c24155090fb39196fa944041"
  "f692f387815e7980b418e6e6b2c2965d79f7f9dfe0fc962f6ed3bbfe5f99570a"
)


pkgver() {
  ### We use as version the timetable year.

  echo "${_pkgver}"
}


build() {
  cd "${srcdir}"

  msg "Please enter your registration code: "
  read _regcode
  cat "TT.ttk.prefix" > TT.ttk
  echo -n "${_regcode}" >> TT.ttk
  cat "TT.ttk.suffix" >> TT.ttk
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"

  install -D -m644 "${srcdir}/TT.ttk" "${_instdir}/TT.ttk"

  install -D -m644 "${srcdir}/IDOS-Licence.pdf"            "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
  install -D -m644 "${srcdir}/copying.txt"            "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
