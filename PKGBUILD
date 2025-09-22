# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://www.mathworks.com/help/install/ug/get-mpm-os-command-line.html

_name="mpm"
pkgname="matlab-${_name}"
_commit="8d84924e79d5d0caa42892a2d4c85c0d3b3fdf87" # 2025.1
pkgver=2025.1
pkgrel=7
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
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/${_commit}/MPM.md"
        "${_pkgsrc}-LICENSE.md::${_url}/raw/${_commit}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64::https://ssd.mathworks.com/supportfiles/downloads/${_name}/${pkgver}/glnxa64/${_name}")
sha256sums=('4f3c20204091db1fbc13d397af9dcdd8270735c91a3e464bf30c91757242233c'
            '2127715135062619aff8b2c3b24512516fd3745a6748f97ff5672b1451a5db1e')
sha256sums_x86_64=('09a430390e93919c95272b3178ebd29468d600791a6e1f2200c48bb25d675243')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  ln -vsf "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${_name}"
}
