# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=ytt-bin
pkgver=0.52.1
pkgrel=1
pkgdesc='YAML templating tool that works on YAML structure instead of text'
url='https://carvel.dev/ytt'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(ytt)
provides=(ytt)
source_x86_64=(ytt-v0.52.1::https://github.com/carvel-dev/ytt/releases/download/v0.52.1/ytt-linux-amd64)
source_aarch64=(ytt-v0.52.1::https://github.com/carvel-dev/ytt/releases/download/v0.52.1/ytt-linux-arm64)
sha256sums_x86_64=(490f138ae5b6864071d3c20a5a231e378cee7487cd4aeffc79dbf66718e65408)
sha256sums_aarch64=(7d86bd3299e43d1455201fc213d698bae7482cd88f3e05de2f935e6eab842db9)
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
