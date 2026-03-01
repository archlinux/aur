pkgname=lyx-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Document processor (Ubuntu resolute binary build)"
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

_debver=2.5.0-1
source=(
  "https://mirrors.kernel.org/ubuntu/pool/universe/l/lyx/lyx_${_debver}_amd64.deb"
  "https://mirrors.kernel.org/ubuntu/pool/universe/l/lyx/lyx-common_${_debver}_all.deb"
)
sha256sums=(
  '21ce81ac0e94d3906cf42e86fca4802effb97713cef7293ba52f50a36b8f0d4b'
  '9740b2c74742102503373641e0e32af6ec2d805f09c8f48230825999f812d6f0'
)

package() {
  local debdir="${srcdir}/deb"
  mkdir -p "${debdir}/lyx" "${debdir}/lyx-common"
  bsdtar -xf "${srcdir}/lyx_${_debver}_amd64.deb" -C "${debdir}/lyx"
  bsdtar -xf "${srcdir}/lyx-common_${_debver}_all.deb" -C "${debdir}/lyx-common"
  bsdtar -xf "${debdir}/lyx/data.tar."* -C "${pkgdir}"
  bsdtar -xf "${debdir}/lyx-common/data.tar."* -C "${pkgdir}"
}
