pkgname=lyx-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="Document processor (Debian testing binary build)"
arch=('x86_64')
url="https://www.lyx.org/"
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'enchant'
  'gcc-libs'
  'file'
  'hunspell'
  'mythes'
  'qt6-base'
  'qt6-svg'
  'xdg-utils'
  'zlib'
)
optdepends=(
  'texlive-core: basic TeX support'
  'texlive-latexextra: extra LaTeX packages'
  'texlive-fontsextra: extra fonts'
  'ghostscript: PS/PDF support'
  'imagemagick: image conversion'
  'poppler: PDF utilities'
)
provides=('lyx')
conflicts=('lyx')
options=('!strip')

_debver=2.5.1-1
source=(
  "https://deb.debian.org/debian/pool/main/l/lyx/lyx_${_debver}_amd64.deb"
  "https://deb.debian.org/debian/pool/main/l/lyx/lyx-common_${_debver}_all.deb"
)
sha256sums=(
  '529bca4034933caab943282b21883b5aa03a1caeb7017ece8e9d6e37598d1bf2'
  '54c64013bb8f523ed5dbd2d5b201cebad06a841a5a8267199b81e21800254e03'
)

package() {
  local debdir="${srcdir}/deb"
  local lyx_data
  local lyx_common_data

  rm -rf "${debdir}/lyx" "${debdir}/lyx-common"
  mkdir -p "${debdir}/lyx" "${debdir}/lyx-common"
  bsdtar --no-same-owner -xf "${srcdir}/lyx_${_debver}_amd64.deb" -C "${debdir}/lyx"
  bsdtar --no-same-owner -xf "${srcdir}/lyx-common_${_debver}_all.deb" -C "${debdir}/lyx-common"

  lyx_data=("${debdir}/lyx"/data.tar.*)
  lyx_common_data=("${debdir}/lyx-common"/data.tar.*)

  bsdtar --no-same-owner -xf "${lyx_data[0]}" -C "${pkgdir}"
  bsdtar --no-same-owner -xf "${lyx_common_data[0]}" -C "${pkgdir}"
}
