# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kbld-bin
pkgver=0.47.1
pkgrel=1
pkgdesc='kbld seamlessly incorporates image building and image pushing into your development and deployment workflows'
url='https://carvel.dev/kbld'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(kbld)
provides=(kbld)
source_x86_64=(kbld-v0.47.1::https://github.com/carvel-dev/kbld/releases/download/v0.47.1/kbld-linux-amd64)
source_aarch64=(kbld-v0.47.1::https://github.com/carvel-dev/kbld/releases/download/v0.47.1/kbld-linux-arm64)
sha256sums_x86_64=(0950151615895b6a699085ba216a321aec35e4808672277281b94fc58cc0686b)
sha256sums_aarch64=(4b649e508d8f5a0d29b15bacf4b70dd43055c284a122fa089524d216c85e9e62)
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
