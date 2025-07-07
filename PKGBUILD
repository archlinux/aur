# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="batch"
pkgname="matlab-${_name}"
pkgver=2025.03.1
pkgrel=4
pkgdesc="CLI tool that starts MATLAB non-interactively using a batch licensing token and any MATLAB startup options"
arch=('x86_64')
_url="https://github.com/mathworks-ref-arch/matlab-dockerfile"
url="${_url}/blob/main/alternates/non-interactive/MATLAB-BATCH.md"
license=('custom:MATLAB EULA')
depends=('matlab' 'matlab-release>=R2020b')
_pkgsrc="${pkgname}" # -${pkgver}
source=("${_pkgsrc}-README.md::${_url}/raw/refs/heads/main/alternates/non-interactive/MATLAB-BATCH.md")
source_x86_64=("${_pkgsrc}-x86_64::https://ssd.mathworks.com/supportfiles/ci/${pkgname}/v1/glnxa64/${pkgname}")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')

prepare() {
  cd "${srcdir}"
  chmod +x ./"${_pkgsrc}-${CARCH}"
}

pkgver() {
  cd "${srcdir}"
  ./"${_pkgsrc}-${CARCH}" -version | 
    sed -n 's/^matlab-batch \([0-9.]\+\) .*/\1/p'
}

build() {
  cd "${srcdir}"
  ./"${_pkgsrc}-${CARCH}" -displayLicenseAgreement > "LICENSE"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"              "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
