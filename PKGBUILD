# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kbld-bin
pkgver=0.42.0
pkgrel=1
pkgdesc='kbld seamlessly incorporates image building and image pushing into your development and deployment workflows'
url='https://carvel.dev/kbld'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
provides=(kbld)
source_x86_64=(kbld-v0.42.0::https://github.com/carvel-dev/kbld/releases/download/v0.42.0/kbld-linux-amd64)
source_aarch64=(kbld-v0.42.0::https://github.com/carvel-dev/kbld/releases/download/v0.42.0/kbld-linux-arm64)
sha256sums_x86_64=(c5eb701a9682e73a8caa636a735bd2a587343bcbdf6c2eaabb5d99b9c57cab7e)
sha256sums_aarch64=(6d8bb0e87fd88d0df2357519ba680c61cf9560b30c199d0a2d60873644ec42f1)
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

_z_binname="kbld"
_z_with_completion="false"
