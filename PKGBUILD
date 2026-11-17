# Maintainer Chris Werner Rau <aur@cwrau.io>

_name=telepresence
_pkgname=${_name}2
pkgname=${_pkgname}-bin
pkgver=2.33.1 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/$_name"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
provides=(telepresence2)
depends=(sshfs)
conflicts=("$_pkgname-git" "$_pkgname")
source_x86_64=("$_name-$pkgver-x86_64::$url/releases/download/v${pkgver}/telepresence-linux-amd64")
sha512sums_x86_64=('b24bbb69bff462f52b296015e4af605b72ba2b47d47ba21ae5994352f3985c086ecbaef6932743080b4ae872576f4bb797ccdceb0165cbbe31171aca3b59cc66')
sha512sums_aarch64=('8db0996414b786f707d8561b87bfe569cc85e3c0b3d79dca43932f1a2df3fdbf738377bac65a5bc9bef22fef0b5aba57db05b36adf1fed3f01f0b05d618a0d51')
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
