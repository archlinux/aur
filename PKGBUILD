# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=pinniped
pkgname=$_pkgname-bin
pkgver=0.41.0 # renovate: datasource=github-releases depName=vmware-tanzu/pinniped
pkgrel=1
pkgdesc="Pinniped provides identity services for Kubernetes clusters"
url="https://github.com/vmware-tanzu/$_pkgname"
license=('Apache-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-cli-linux-amd64")
arch=('x86_64')
sha512sums=('6febba8f905cbbd18c503e22daec2f8e7ca1481bbee2716b348626392720a5c3cc8a46ec0838d15aa8c0b358f8e241c2bee5a040057cf9f2a8d18876f4097b89')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
    install -D -m 0755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion zsh >"$srcdir/zsh_$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion bash >"$srcdir/bash_$_pkgname"
    install -D -m 0644 "$srcdir/zsh_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -D -m 0644 "$srcdir/bash_$_pkgname" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}

#vim: syntax=sh
