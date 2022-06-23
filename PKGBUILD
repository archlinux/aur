# Maintainer: Alex <wowlinux at 126 dot com>

pkgname=trdsql-bin
_pkgname=trdsql
pkgver=0.10.0
pkgrel=1
pkgdesc="Tool that can execute SQL queries on CSV, LTSV and JSON"
arch=('x86_64' 'i686')
url="https://github.com/noborus/trdsql"
license=('MIT')
conflicts=('trdsql')
depends=('glibc')
source_x86_64=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/trdsql_v${pkgver}_linux_amd64.zip"
  "trdsql-completion.zsh"
)
source_i686=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/trdsql_v${pkgver}_linux_386.zip"
  "trdsql-completion.zsh"
)
sha256sums_x86_64=(
  'b1a4a1d2700870f2ba201cdad1e23d92b16c3c2fea8977a783dd1662500cf37a'
  'c7ebfa2d1eb4f56b8ae404c66a2796e7e76e61e35b189ccee8e6363686aed6a6'
)
sha256sums_i686=(
  'd55df476d3a957662ce0bd897ec984ec1535f87228d4bd7e3e87555d32cf7b87'
  'c7ebfa2d1eb4f56b8ae404c66a2796e7e76e61e35b189ccee8e6363686aed6a6'
)

package() {
  case $CARCH in
  x86_64) _arch='amd64';;
  i686)   _arch='386';;
  *) exit 1 ;;
  esac
  cd trdsql_v${pkgver}_linux_${_arch}
  install -Dm 755 trdsql -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 config.json.sample -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 "${srcdir}/trdsql-completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

# vim: ts=2 sw=2 et:
