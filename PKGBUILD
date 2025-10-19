# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://www.mathworks.com/help/install/ug/get-mpm-os-command-line.html

_name="mpm"
pkgname="matlab-${_name}"
_commit="df30d7e712e37c2fa54638ff81870e705946ee66" # 2025.1
pkgver="2025.2+g${_commit::7}"
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
optdepends=(
  "${pkgname}-input: input files used with '--inputfile'"
)
source=("${pkgname}-${_commit}-README.md::${_url}/raw/${_commit}/MPM.md"
        "${pkgname}-${_commit}-LICENSE.md::${_url}/raw/${_commit}/LICENSE.md")
source_x86_64=("${pkgname}-${_pkgver}-x86_64::https://ssd.mathworks.com/supportfiles/downloads/${_name}/${_pkgver}/glnxa64/${_name}")
sha256sums=('e0d475cf02ad6e6c3c2cfb5a9c63f52015ae6585a2d0b1dba7a0a8870c482eae'
            '2127715135062619aff8b2c3b24512516fd3745a6748f97ff5672b1451a5db1e')
sha256sums_x86_64=('b7286fa4d433a40a1575c9d09d842a2a2f0271a3aa2693e6ebddb44056011732')

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}-${_pkgver}-${CARCH}"   "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "${pkgname}-${_commit}-README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${pkgname}-${_commit}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  ln -vsf "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${_name}"
}
