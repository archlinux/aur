# Maintainer Chris Werner Rau <aur@cwrau.io>

_name=telepresence
_pkgname=${_name}2
pkgname=${_pkgname}-bin
pkgver=2.22.6 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/telepresence"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
arch=('x86_64' 'aarch64')
provides=(telepresence2)
conflicts=("$_pkgname-git" "$_pkgname")
source=("$_name::https://github.com/telepresenceio/telepresence/releases/download/v${pkgver}/telepresence-linux-amd64")
sha512sums=('96ef7df1a0103de1c0d16ed3396a093f007d64d1f7749ac6dd9e3c58ef128d2fbd4a055676b8196e0d3facf9ed121fad803aef7fd4eb17d3a6183644618f22f9')
sha512sums_aarch64=('96ef7df1a0103de1c0d16ed3396a093f007d64d1f7749ac6dd9e3c58ef128d2fbd4a055676b8196e0d3facf9ed121fad803aef7fd4eb17d3a6183644618f22f9')
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
