# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=ytt-bin
pkgver=0.53.0
pkgrel=1
pkgdesc='YAML templating tool that works on YAML structure instead of text'
url='https://carvel.dev/ytt'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(ytt)
provides=(ytt)
source_x86_64=(ytt-v0.53.0::https://github.com/carvel-dev/ytt/releases/download/v0.53.0/ytt-linux-amd64)
source_aarch64=(ytt-v0.53.0::https://github.com/carvel-dev/ytt/releases/download/v0.53.0/ytt-linux-arm64)
sha256sums_x86_64=(2e4986f44f3908a0a220b645587eab4d0ec70ff4a6818ca26d3a44e29e25f13c)
sha256sums_aarch64=(f4922e95801bc2b9b4baf553d4650b9300670e2821e20690026f1bfd78cf8cd5)
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
