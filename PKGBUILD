# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=ytt-bin
pkgver=0.47.0
pkgrel=4
pkgdesc='YAML templating tool that works on YAML structure instead of text'
url='https://carvel.dev/ytt'
arch=(x86_64 aarch64)
license=(apache-2.0)
provides=(ytt)
source_x86_64=(ytt-v0.47.0::https://github.com/carvel-dev/ytt/releases/download/v0.47.0/ytt-linux-amd64)
source_aarch64=(ytt-v0.47.0::https://github.com/carvel-dev/ytt/releases/download/v0.47.0/ytt-linux-arm64)
sha256sums_x86_64=(de2dd0a659fd12b2d80e00fa2a4a9316db67e0372e79c3bf48586ea53201180e)
sha256sums_aarch64=(f12dc884af6be46a56c4233cbe456e90d8082d4699c0412d4adfaaae68712f4d)
package () 
{ 
    set -eo pipefail;
    BIN_SRC="${srcdir}/${_z_binname}-v${pkgver}";
    BIN_DST="${pkgdir}/usr/bin/${_z_binname}";
    install -Dm 755 "$BIN_SRC" "$BIN_DST";
    if [[ "$_z_with_completion" == "true" ]]; then
        mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
        mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
        mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
        "$BIN_DST" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_z_binname";
        "$BIN_DST" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_z_binname.fish";
        "$BIN_DST" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_z_binname";
    fi
}


# Custom variables

_z_binname="ytt"
_z_with_completion="true"
