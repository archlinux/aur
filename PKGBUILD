# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=crd-wizard
pkgname=$_pkgname-bin
pkgver=0.1.7 # renovate: datasource=github-releases depName=pehlicd/crd-wizard
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
sha512sums_x86_64=('9f62c75892c8821400a3f24af9de0d710436348314714cb69d1694b72735c3f19317f4b7b73f3952be12149747e5f882cf1d84f7a2cdb7872ad190b2ba00584e')
sha512sums_aarch64=('8b65c2d06ecaa52d2e1330de16968dfeac0fe67f8fed3f3eb0c1f73021c9afc7a4c65a0fb7deacb1a898a32bc646343599af9b537724c14a073feb686060bff9')
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
