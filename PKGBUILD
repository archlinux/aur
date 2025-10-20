# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://www.mathworks.com/help/install/ug/get-mpm-os-command-line.html

_name="mpm"
pkgname="matlab-${_name}"
_commit="df30d7e712e37c2fa54638ff81870e705946ee66" # 2025.2
pkgver=2025.2+r123.gdf30d7e
_pkgver="${pkgver%+*}"
pkgrel=1
epoch=1
pkgdesc="MATLAB Package Manager"
arch=('x86_64')
url="https://www.mathworks.com/products/mpm.html"
_url="https://github.com/mathworks-ref-arch/matlab-dockerfile"
license=('custom:MATLAB EULA')
depends=(
  'ca-certificates'
  'glibc'
  'unzip'
)
makedepends=(
  'git'
)
optdepends=(
  "${pkgname}-input: input files used with '--inputfile'"
)
_pkgsrc="${_url##*/}"
source=("${_pkgsrc}::git+${_url}.git#commit=${_commit}")
source_x86_64=("${pkgname}-${_pkgver}-x86_64::https://ssd.mathworks.com/supportfiles/downloads/${_name}/${_pkgver}/glnxa64/${_name}")
sha256sums=('507c72e4f665d0ad2d9970ed68b94aa6ed7909b112fdd7aa13ff251ee8cec135')
sha256sums_x86_64=('b7286fa4d433a40a1575c9d09d842a2a2f0271a3aa2693e6ebddb44056011732')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf '%s+r%s.g%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}-${_pkgver}-${CARCH}"   "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "MPM.md"     "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  ln -vsf "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${_name}"
}
