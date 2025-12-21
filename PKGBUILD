# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=crd-wizard
pkgname=$_pkgname-bin
pkgver=0.1.5 # renovate: datasource=github-releases depName=pehlicd/crd-wizard
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
sha512sums_x86_64=('65f9f246952ccd69904ffbb4d9be78aabb4bbd3ea030ba1aac43cb79cb42f4a9f68c0fdd4588bb51bfeb0572dc5c62a2172766a7f75a5166a79522286c3fefa1')
sha512sums_aarch64=('2cd826167782a30757fbcfb3aaae6b16dfcc9c17d7023f8e7e6f02d9301815aaed7f4f9b560440b70d27bb1d15d9e037fb410266a3c16fa7924c6ad4fcd1b98c')
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
