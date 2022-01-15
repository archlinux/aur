# Maintainer: Alex <wowlinux at 126 dot com>

pkgname=trdsql-bin
_pkgname=trdsql
pkgver=0.9.1
pkgrel=1
pkgdesc="Tool that can execute SQL queries on CSV, LTSV and JSON"
arch=('x86_64' 'i686')
_arch=$(case $(uname -m) in x86_64) echo amd64;; i686) echo 386;; *) exit 1;; esac)
url="https://github.com/noborus/trdsql"
license=('MIT')
conflicts=('trdsql')
depends=('glibc')
source=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/trdsql_v${pkgver}_linux_${_arch}.zip"
  "trdsql-completion.zsh"
)
sha256sums=(
  $(case $_arch in
    amd64) echo 'f8883e94905a2e32e8df589ae09e00f7cbdfb1937683852852626467e2b9582c' ;;
    386)   echo 'a72179c49c8280c7c46e9b78a0341dd2e41e2380b2a81f6d1016f1825012610e' ;;
  esac)
  'c7ebfa2d1eb4f56b8ae404c66a2796e7e76e61e35b189ccee8e6363686aed6a6'
)

package() {
  cd trdsql_v${pkgver}_linux_${_arch}
  install -Dm 755 trdsql -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 config.json.sample -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 "${srcdir}/trdsql-completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

# vim: ts=2 sw=2 et:
