# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=crd-wizard
pkgname=$_pkgname-bin
pkgver=0.1.1 # renovate: datasource=github-releases depName=pehlicd/crd-wizard
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
sha512sums_x86_64=('739ca74d632c69cdc97e3e0049b655572fc474ee263a6e36101eaa98f0097a7c3124175f94ec1078947ab366d4aab997b911fb72f623ce12e7ac24e90a54d801')
sha512sums_aarch64=('fd66c44f1815c1a12cd9b4f8a1e559db31a7a78e1df625355cc6279bf87bd4bf114075cb725478cbe52ee1fa4d4ed80f2931a8b443b98b04d59d53455c297fa5')
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
