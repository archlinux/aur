# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="matlab-mcp-server"
pkgname="${_pkgname}-bin"
pkgver=0.12.0
pkgrel=1
pkgdesc="Run MATLAB® using AI applications with the official MATLAB MCP Server from MathWorks®"
arch=(
  'x86_64' # x64
)
url="https://www.mathworks.com/products/matlab-mcp-server.html"
_url="https://github.com/matlab/${_pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'matlab-release>=R2020b'
  'sh'
)
provides=(
  "${_pkgname}=${pkgver}"
  "matlab-mcp-core-server=${pkgver}"
  "matlab-mcp-core-server-bin=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "matlab-mcp-core-server"
)
replaces=(
  "matlab-mcp-core-server-bin<=0.10.1-1"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgname}.sh"
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-x64"
)
sha256sums=('baf366fb285ace6191a4abef69f003b3135c16ff9df043b274abaa4edc8df1bf'
            'f9b76e980edf107e31ba799a906b9fc76f1e1d0807238672d4481f441ac06c89'
            '2cb440d3a47c8ea1ea975d7b15175b87ec31173ab671d073112520d065ec4625')
sha256sums_x86_64=('56f8f17c721af9fd435695c1314009ddebc72a4db6920ca9eca4fa0b606b89f5')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh"        "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
