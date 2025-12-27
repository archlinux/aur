# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=pinniped
pkgname=$_pkgname-bin
pkgver=0.43.0 # renovate: datasource=github-releases depName=vmware-tanzu/pinniped
pkgrel=1
pkgdesc="Pinniped provides identity services for Kubernetes clusters"
url="https://github.com/vmware-tanzu/$_pkgname"
license=('Apache-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-cli-linux-amd64")
arch=('x86_64')
sha512sums=('9ba633a26b07ae751096f75bce83fd6871022932aebf8922b8f87818035329a4a1374d4731715f478b94cad1364836b4855f1c87c6ac61e413f8854c09ca9040')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
    install -D -m 0755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion zsh >"$srcdir/zsh_$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion bash >"$srcdir/bash_$_pkgname"
    install -D -m 0644 "$srcdir/zsh_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -D -m 0644 "$srcdir/bash_$_pkgname" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}

#vim: syntax=sh
