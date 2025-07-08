# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=pinniped
pkgname=$_pkgname-bin
pkgver=0.39.0 # renovate: datasource=github-releases depName=vmware-tanzu/pinniped
pkgrel=2
pkgdesc="Pinniped provides identity services for Kubernetes clusters"
url="https://github.com/vmware-tanzu/$_pkgname"
license=('Apache-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-cli-linux-amd64")
arch=('x86_64')
sha512sums=('1d5015b4dca74e2f4eb4a33651e242a4b00eccf646ddbd33e5e74f4a50fe34986757dbe35968ba1d80721f6e8a8608643281473f011589145392ad28a5e0c224')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
    install -D -m 0755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion zsh >"$srcdir/zsh_$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion bash >"$srcdir/bash_$_pkgname"
    install -D -m 0644 "$srcdir/zsh_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -D -m 0644 "$srcdir/bash_$_pkgname" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}

#vim: syntax=sh
