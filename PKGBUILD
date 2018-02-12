# Maintainer: dreieck

_pkgname=ttf-dni
pkgname="${_pkgname}"
pkgver=2.2
_dlver="$(echo ${pkgver} | tr -d '.')"
pkgrel=1
pkgdesc="TrueType D'ni font (from the Myst game series). Contains a normal version, a version with character mapping according to new standard, and an angular (non-round) version."
arch=('any')
url="http://linguists.riedl.org/old/sebastian/"
license=('custom')

depends=(
)

makedepends=(
  "fontconfig"
  "unzip"
  "xorg-mkfontscale"
  "xorg-mkfontdir"
  "xorg-xset"
)

provides=("ttf-dniscript=${pkgver}")

install='dniscript.install'

source=(
  "http://linguists.riedl.org/old/sebastian/dniscrpt${_dlver}.zip"
  "website.html::${url}"
  "license-dummy.txt"
  "${install}"
)

sha256sums=(
  "11e684041c2a8baecb4868442ecb6036c42f97d5bd96785f562ca1855697c466"
  "SKIP"
  "SKIP"
  "SKIP"
)

prepare() {
  cd "${srcdir}"
  echo "${url}" > "${srcdir}/website.url"
}

package() {
  cd "${srcdir}"

  install -D -v -m644 "D'NI_ANG.TTF" "${pkgdir}/usr/share/fonts/dniscript/dni_ang.ttf"
  install -D -v -m644 "D'NI_SCR.TTF" "${pkgdir}/usr/share/fonts/dniscript/dni_scr.ttf"
  install -D -v -m644 "D'NI_SLM.TTF" "${pkgdir}/usr/share/fonts/dniscript/dni_slm.ttf"

  install -D -v -m644 license-dummy.txt "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -v -m644 README.HTM "${pkgdir}/usr/share/doc/${_pkgname}/readme.html"
  install -D -v -m644 WHATSNEW.TXT "${pkgdir}/usr/share/doc/${_pkgname}/whatsnew.txt"
  install -D -v -m644 website.html "${pkgdir}/usr/share/doc/${_pkgname}/website.html"
  install -D -v -m644 website.url "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
}
