# Maintainer Chris Werner Rau <aur@cwrau.io>

_name=telepresence
_pkgname=${_name}2
pkgname=${_pkgname}-bin
pkgver=2.22.4 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/telepresence"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
arch=('x86_64' 'aarch64')
provides=(telepresence2)
conflicts=("$_pkgname-git" "$_pkgname")
source=("$_name::https://github.com/telepresenceio/telepresence/releases/download/v${pkgver}/telepresence-linux-amd64")
sha512sums=('0a42954b34db009b0a8f51125089fac9a92e1273a19b6ad1e2ea2da44ba89a8203b3a82e1234bf579cd9cea779b9147febc27de8dd0c1eb996869f1201047c59')
sha512sums_aarch64=('0a42954b34db009b0a8f51125089fac9a92e1273a19b6ad1e2ea2da44ba89a8203b3a82e1234bf579cd9cea779b9147febc27de8dd0c1eb996869f1201047c59')
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
