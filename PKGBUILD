# Maintainer Chris Werner Rau <aur@cwrau.io>

_name=telepresence
_pkgname=${_name}2
pkgname=${_pkgname}-bin
pkgver=2.21.3
pkgrel=0
url="https://github.com/telepresenceio/telepresence"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
arch=('x86_64' 'aarch64')
provides=(telepresence2)
conflicts=("$_pkgname-git" "$_pkgname")
source=("$_name::https://github.com/telepresenceio/telepresence/releases/download/v${pkgver}/telepresence-linux-amd64")
sha512sums=('60188c9d4f12fca86b1ab298052273aaec9711c05a1043516083489590e3e5683ebd3317da9d6906e3be141b67bb79ef8d8eaa9b24e7fb94e786a01085f5babd')
sha512sums_aarch64=('60188c9d4f12fca86b1ab298052273aaec9711c05a1043516083489590e3e5683ebd3317da9d6906e3be141b67bb79ef8d8eaa9b24e7fb94e786a01085f5babd')
source_aarch64=("$_name::https://github.com/telepresenceio/telepresence/releases/download/v${pkgver}/telepresence-linux-arm64")
depends=()

package() {
    install -D -m 0755 "$srcdir/$_name" "$pkgdir/usr/bin/$_name"
    "$pkgdir/usr/bin/$_name" completion zsh >"$srcdir/zsh_$_name"
    "$pkgdir/usr/bin/$_name" completion fish >"$srcdir/fish_$_name"
    "$pkgdir/usr/bin/$_name" completion bash >"$srcdir/bash_$_name"
    install -D -m 0644 "$srcdir/zsh_$_name" "$pkgdir/usr/share/zsh/site-functions/_$_name"
    install -D -m 0644 "${srcdir}/fish_$_name" "${pkgdir}/usr/share/fish/completions/$_name.fish"
    install -D -m 0644 "$srcdir/bash_$_name" "$pkgdir/usr/share/bash-completion/completions/$_name"
}
