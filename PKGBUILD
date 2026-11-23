# Maintainer Chris Werner Rau <aur@cwrau.io>

_name=telepresence
_pkgname=${_name}2
pkgname=${_pkgname}-bin
pkgver=2.33.4 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/$_name"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=(telepresence2)
depends=(sshfs)
conflicts=("$_pkgname-git" "$_pkgname")
source_x86_64=("$_name-$pkgver-x86_64::$url/releases/download/v${pkgver}/telepresence-linux-amd64")
sha512sums_x86_64=('8811ec829466d3c70ccab7ab4dabfd09580ddfac0dd0c52b2ac557465ffe45744699be347fd14193a9bd021f5d30832a839e0261c9a809b4411eb767bca25e3e')
sha512sums_aarch64=('2e4431964ed297c87768780842d98b17a19a65bdb4e3974741642f6ec7edd1ef61962a26e41f433facf7f39e482d7e1173aa98d6218abb8753cafbcdb39f2533')
source_aarch64=("$_name-$pkgver-aarch64::$url/releases/download/v${pkgver}/telepresence-linux-arm64")

package() {
    install -D -m 0755 "$srcdir/$_name-$pkgver-$CARCH" "$pkgdir/usr/bin/$_name"
    "$pkgdir/usr/bin/$_name" completion zsh >"$srcdir/zsh_$_name"
    "$pkgdir/usr/bin/$_name" completion fish >"$srcdir/fish_$_name"
    "$pkgdir/usr/bin/$_name" completion bash >"$srcdir/bash_$_name"
    install -D -m 0644 "$srcdir/zsh_$_name" "$pkgdir/usr/share/zsh/site-functions/_$_name"
    install -D -m 0644 "$srcdir/fish_$_name" "$pkgdir/usr/share/fish/completions/$_name.fish"
    install -D -m 0644 "$srcdir/bash_$_name" "$pkgdir/usr/share/bash-completion/completions/$_name"
}
