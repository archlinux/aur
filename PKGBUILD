# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=crd-wizard
pkgname=$_pkgname-bin
pkgver=0.1.6 # renovate: datasource=github-releases depName=pehlicd/crd-wizard
pkgrel=1
pkgdesc="CR(D) Wizard is a web and tui based dashboard [for viewing CRDs]"
url="https://github.com/pehlicd/crd-wizard"
license=('GPL-3.0-only')
source_x86_64=(
  "$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_v${pkgver}_linux_amd64.tar.gz"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_v${pkgver}_linux_arm64.tar.gz"
)
arch=('x86_64' 'aarch64')
sha512sums_x86_64=('e609f8fbc429b1bacc7b928fc4104082d8fcb345d829dcb6a34e6f9d12b308b53ba938fbee25b163463e573aba26922d2201dc1b86275608a80c8fdee5d8bf6b')
sha512sums_aarch64=('ba3c2ef0e2209b0497e888cbb0013ebf0bd9f2e5c78f0c311620891d7593bb46ad98dc7cfc5909e7324a69801d8905eac8f8596c702528a5c36d26cd2d2861d3')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  "${pkgdir}/usr/bin/${_pkgname}" completion zsh >"$srcdir/zsh_${_pkgname}"
  "${pkgdir}/usr/bin/${_pkgname}" completion fish >"${srcdir}/fish_${_pkgname}"
  "${pkgdir}/usr/bin/${_pkgname}" completion bash >"$srcdir/bash_${_pkgname}"
  install -D -m 0644 "$srcdir/zsh_${_pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
  install -D -m 0644 "${srcdir}/fish_${_pkgname}" "${pkgdir}/usr/share/fish/completions/${_pkgname}.fish"
  install -D -m 0644 "$srcdir/bash_${_pkgname}" "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
}

#vim: syntax=sh
