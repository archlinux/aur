# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kapp-bin
pkgver=0.59.1
pkgrel=4
pkgdesc='kapp is a simple deployment tool focused on the concept of "Kubernetes application" — a set of resources with the same label'
url='https://carvel.dev/kapp'
arch=(x86_64 aarch64)
license=(apache-2.0)
provides=(kapp)
source_x86_64=(kapp-v0.59.1::https://github.com/carvel-dev/kapp/releases/download/v0.59.1/kapp-linux-amd64)
source_aarch64=(kapp-v0.59.1::https://github.com/carvel-dev/kapp/releases/download/v0.59.1/kapp-linux-arm64)
sha256sums_x86_64=(a6da34c733514c2c51b96a12e70cd050250a45b2ee75d6966a904e712b307d15)
sha256sums_aarch64=(a0e4eccdc264b535d7b0ba1972b6fd29cd5aa1263ab7e996d5a4671253fd3cf9)
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

_z_binname="kapp"
