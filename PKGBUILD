# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=pinniped
pkgname=$_pkgname-bin
pkgver=0.37.0 # renovate: datasource=github-releases depName=vmware-tanzu/pinniped
pkgrel=1
pkgdesc="Pinniped provides identity services for Kubernetes clusters"
url="https://github.com/vmware-tanzu/$_pkgname"
license=('APACHE')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-cli-linux-amd64")
arch=('x86_64')
sha512sums=('ea2e0d95b615be84dce3c105ec743dd3bdbe83dc768b34fdd4dc692dd91cd695bb42ed81f0b37738c28107cd8065a0aac1ed5ca81456cf65c6e9147fe165758a')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
    install -D -m 0755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion zsh >"$srcdir/zsh_$_pkgname"
    "$pkgdir/usr/bin/$_pkgname" completion bash >"$srcdir/bash_$_pkgname"
    install -D -m 0644 "$srcdir/zsh_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -D -m 0644 "$srcdir/bash_$_pkgname" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}

#vim: syntax=sh
