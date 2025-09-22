# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=crd-wizard
pkgname=$_pkgname-bin
pkgver=0.1.3 # renovate: datasource=github-releases depName=pehlicd/crd-wizard
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
sha512sums_x86_64=('77b3d68e90334e8cf65aab7df44d2f8ea5b791bc7afcb65a00416f6fb6c5d5ccaa7c234f44ea10a9b6185e9eddbe3d77193940eb480cb5ac9b09d0af52bc4c1b')
sha512sums_aarch64=('e4226eff6249b14876810ae625a012fb5883de8d7e5900d1ea11a0568ad76e7d93ca354dc3188248112c070afc84d09857703703327473bc754e922867f35a53')
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
