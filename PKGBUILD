# Maintainer Chris Werner Rau <aur@cwrau.io>

_name=telepresence
_pkgname=${_name}2
pkgname=${_pkgname}-bin
pkgver=2.23.3 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=2
url="https://github.com/telepresenceio/$_name"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=(telepresence2)
conflicts=("$_pkgname-git" "$_pkgname")
source_x86_64=("$_name-x86_64::$url/releases/download/v${pkgver}/telepresence-linux-amd64")
sha512sums_x86_64=('ee88f91dbe536a1413055c85f0a14decfbb2757e43c914f7ddd1daa4170563cc0af2cd8d1ea8cfc2cfcf6375d72118555abff309e7f513013ee5a70bccf5bcb6')
sha512sums_aarch64=('d409dfea093d23ca079b76cacb5f8177c3b7e6b5bafa4ef50f246698b289cc188f2cc5b01e418c8330c19137237c62ab8d41c37b7d7cf2ba067868d4b2107615')
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
