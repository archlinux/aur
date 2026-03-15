# Maintainer: Sebastian Eberlein <aur@s.eberlein.xyz>
# https://github.com/sebasnabas/pkgbuilds
# vi: ft=sh

_pkgname='weaver'
pkgname="otel-${_pkgname}-bin"
pkgver=0.22.1
pkgrel=1
pkgdesc='OpenTelemetry Weaver'
arch=('x86_64')
url="https://github.com/open-telemetry/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('011ae7c05022c294f24b0156dc28dc19e8487b8cdafefcd7ad317f32416e68b4')

package() {
  pushd "${srcdir}/${_pkgname}-x86_64-unknown-linux-gnu"
  install -Dm 755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm 644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  "./${_pkgname}" completion --quiet bash > bash-completion
  "./${_pkgname}" completion --quiet zsh  > zsh-completion
  "./${_pkgname}" completion --quiet fish > fish-completion

  install -Dm 644 'bash-completion' "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 'zsh-completion'  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 'fish-completion' "${pkgdir}/usr/share/fish/completions/${_pkgname}.fish"
}
