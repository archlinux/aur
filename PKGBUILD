pkgname=lyx-bin
pkgver=2.5.3
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

_debver=2.5.3-2
source=(
  "https://deb.debian.org/debian/pool/main/l/lyx/lyx_${_debver}_amd64.deb"
  "https://deb.debian.org/debian/pool/main/l/lyx/lyx-common_${_debver}_all.deb"
)
sha256sums=(
  'e568495ef76d40ee1300f8c917f5b889d53d55905d140eb24ae5dae8436bf6c5'
  'ad8f68b4377862e3b0f39344441a9c66366a3d7496677894ad609f3a2b08f737'
)

package() {
  local debdir="${srcdir}/deb"
  local pkg

  rm -rf "${debdir}/lyx" "${debdir}/lyx-common"
  mkdir -p "${debdir}/lyx" "${debdir}/lyx-common"

  for pkg in lyx lyx-common; do
    bsdtar --no-same-owner -xf "${srcdir}/${pkg}_${_debver}_"*.deb -C "${debdir}/${pkg}"
    bsdtar --no-same-owner -xf "${debdir}/${pkg}/data.tar."* -C "${pkgdir}"
  done
}
