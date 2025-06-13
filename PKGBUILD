# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_stamp="$(date +%s%3N)"
# _stamp="dev"

_name="batch"
pkgname="matlab-${_name}"
pkgver=2025.03.1
pkgrel=1
pkgdesc="CLI tool that starts MATLAB non-interactively using a batch licensing token and any MATLAB startup options"
arch=('x86_64')
_url="https://github.com/mathworks-ref-arch/matlab-dockerfile"
url="${_url}/blob/main/alternates/non-interactive/MATLAB-BATCH.md"
license=('custom:MATLAB EULA')
# depends=('glibc')
optdepends=('matlab') # >=R2020b
_pkgsrc="${pkgname}-${_stamp}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/heads/main/alternates/non-interactive/MATLAB-BATCH.md")
source_x86_64=("${_pkgsrc}-x86_64::https://ssd.mathworks.com/supportfiles/ci/${pkgname}/v1/glnxa64/${pkgname}")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')

pkgver() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}"
  ./"${_pkgsrc}-${CARCH}" -version | 
    sed -n 's/^matlab-batch \([0-9.]\+\) .*/\1/p'
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
