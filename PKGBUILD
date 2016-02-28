# Maintainer: dreieck

_pkgname=idos-timetable-browser
pkgname="${_pkgname}"
pkgver=1.27_lib2.5.0.1_date20150210
pkgrel=1
pkgdesc="Offline railway and other public transport timetable search engine by CHAPS."
arch=('i686' 'x86_64')
url="http://www.chaps.cz/eng/download/idos"
license=('custom')

depends=(
  "ttf-timetable"
  "wine"
)

makedepends=(
  "p7zip"
)

optdepends=(
  "idos-timetable-data: For timetable data. (You need at least one to use the software.)"
  "idos-timetable-lang-de: For German translation."
  "idos-timetable-lang-en: For English translation."
)

provides=()
replaces=()
conflicts=()

source=(
  "ttakt.exe::http://ttakt.chaps.cz/TTAktual/Win/TTAKT.EXE"
  "idos-timetable-browser.sh"
  "license-dummy.txt"
  "info.url"
)

sha256sums=(
  "4d2cc193de9d48c3bab6d99af463ba724af41dfec45395b7ce2fab2cbecc2aa4"
  "a853d967e224c15eac600662de535123417fb22ff63041b0202dbfa290c3e266"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
  "d302ccfd82cc9057751f79b6f0f310676b539a201e943ff7c2fd9b9dbaf29b53"
)


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  _execdir="${pkgdir}/usr/bin"
  install -d -m755 "${_instdir}"
  cd "${_instdir}"

  7z x "${srcdir}/ttakt.exe"
  chmod 644 *
  chmod 755 TT.exe

  install -d -m755 timetables

  install -D -m644 "${srcdir}/info.url" "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"

  install -D -m755 "${srcdir}/idos-timetable-browser.sh" "${_execdir}/idos-timetable-browser"
}
