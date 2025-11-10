# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://www.mathworks.com/help/install/ug/get-mpm-os-command-line.html

_name="mpm"
pkgname="matlab-${_name}"
_commit="741261e76ff40685cd9498892c86af39ad5adecb" # 2025.2.1
pkgver=2025.2.1+r124.g741261e
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
sha256sums=('0a380b5fc330b28f29b2413eeba41e1f72791dac1f349ade254246f42b77454f')
sha256sums_x86_64=('6049afb56971811f252f2a96f5e014a1204f625be0bd01e3217b1bf085b1df75')

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
