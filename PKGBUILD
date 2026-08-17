# Maintainer Chris Werner Rau <aur@cwrau.io>

_name=telepresence
_pkgname=${_name}2
pkgname=${_pkgname}-bin
pkgver=2.31.2 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/$_name"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=(telepresence2)
depends=(sshfs)
conflicts=("$_pkgname-git" "$_pkgname")
source_x86_64=("$_name-$pkgver-x86_64::$url/releases/download/v${pkgver}/telepresence-linux-amd64")
sha512sums_x86_64=('e8f1a284af72604396562a20eb0142843369bd51281aa8b39b1262de1f3e035d2761a3f61fed6efb0106ba7325a23dfd2d92a2d7944b0ced4b82dfe900cd5353')
sha512sums_aarch64=('a2966680412250f75b5cf145089869d1d1018223a6ccd126f73f11d667da3bd4c0df32e4fe183145bd3de55644057167e131e9410e064998ab84697dffef45d9')
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
