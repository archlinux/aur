# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=ytt-bin
pkgver=0.46.2
pkgrel=3
pkgdesc='YAML templating tool that works on YAML structure instead of text'
url='https://carvel.dev/ytt'
arch=(x86_64 aarch64)
license=(apache-2.0)
provides=(ytt)
source_x86_64=(ytt-v0.46.2::https://github.com/carvel-dev/ytt/releases/download/v0.46.2/ytt-linux-amd64)
source_aarch64=(ytt-v0.46.2::https://github.com/carvel-dev/ytt/releases/download/v0.46.2/ytt-linux-arm64)
sha256sums_x86_64=(ae9bc66a55756eed60db86f8c0f8c55704b3ab846513ad4502111c2a8673ecac)
sha256sums_aarch64=(e43a524db8a0c69a54bc56132ac0cf8d55a049c48f63a9047dd6984dc89a940e)
package () 
{ 
    set -eo pipefail;
    BIN_SRC="${srcdir}/${_z_binname}-v${pkgver}";
    BIN_DST="${pkgdir}/usr/bin/${_z_binname}";
    install -Dm 755 "$BIN_SRC" "$BIN_DST";
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    "$BIN_DST" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_z_binname";
    "$BIN_DST" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_z_binname.fish";
    "$BIN_DST" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_z_binname"
}


# Custom variables

_z_binname="ytt"
