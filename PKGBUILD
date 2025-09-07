# Maintainer Chris Werner Rau <aur@cwrau.io>

_name=telepresence
_pkgname=${_name}2
pkgname=${_pkgname}-bin
pkgver=2.24.1 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/$_name"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=(telepresence2)
conflicts=("$_pkgname-git" "$_pkgname")
source_x86_64=("$_name-x86_64::$url/releases/download/v${pkgver}/telepresence-linux-amd64")
sha512sums_x86_64=('4d06c7a60acf9d8ce9ffa92899e0cc89dd6bb8aabe5a87028e9ca318e23e0ffac99c002828b087eb6161c60d3a38026f35f4867dcff6bdc117c5736a229c4fcd')
sha512sums_aarch64=('4c7926197443df886c075c90798d24a3bea074318acc9a787301c1839dc2483b127876543f847a04f7d5df9139fb3f3955f885cf6b74dc3f790c2b5ae3f876d9')
source_aarch64=("$_name-aarch64::$url/releases/download/v${pkgver}/telepresence-linux-arm64")

package() {
    install -D -m 0755 "$srcdir/$_name-$CARCH" "$pkgdir/usr/bin/$_name"
    "$pkgdir/usr/bin/$_name" completion zsh >"$srcdir/zsh_$_name"
    "$pkgdir/usr/bin/$_name" completion fish >"$srcdir/fish_$_name"
    "$pkgdir/usr/bin/$_name" completion bash >"$srcdir/bash_$_name"
    install -D -m 0644 "$srcdir/zsh_$_name" "$pkgdir/usr/share/zsh/site-functions/_$_name"
    install -D -m 0644 "$srcdir/fish_$_name" "$pkgdir/usr/share/fish/completions/$_name.fish"
    install -D -m 0644 "$srcdir/bash_$_name" "$pkgdir/usr/share/bash-completion/completions/$_name"
}
