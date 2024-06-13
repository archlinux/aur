# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kapp-bin
pkgver=0.62.1
pkgrel=1
pkgdesc='kapp is a simple deployment tool focused on the concept of "Kubernetes application" — a set of resources with the same label'
url='https://carvel.dev/kapp'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(kapp)
provides=(kapp)
source_x86_64=(kapp-v0.62.1::https://github.com/carvel-dev/kapp/releases/download/v0.62.1/kapp-linux-amd64)
source_aarch64=(kapp-v0.62.1::https://github.com/carvel-dev/kapp/releases/download/v0.62.1/kapp-linux-arm64)
sha256sums_x86_64=(b686bd63e5f751496d8221c7cf3df308663b6b21e1c480dd4a4cd301f6a8d651)
sha256sums_aarch64=(f5d2e48c21c25e4b59438bbf6e709a6335374dd78737fda455d477f6de62aa33)
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

_z_binname="kapp"
_z_with_completion="true"
