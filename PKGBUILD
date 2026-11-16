# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=vendir-bin
pkgver=0.47.0
pkgrel=1
pkgdesc='Easy way to vendor portions of git repos, github releases, helm charts, docker image contents, etc. declaratively'
url='https://carvel.dev/vendir'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(vendir)
provides=(vendir)
source_x86_64=(vendir-v0.47.0::https://github.com/carvel-dev/vendir/releases/download/v0.47.0/vendir-linux-amd64)
source_aarch64=(vendir-v0.47.0::https://github.com/carvel-dev/vendir/releases/download/v0.47.0/vendir-linux-arm64)
sha256sums_x86_64=(9d1099f48f04882a716934178bb9ba8f2373c96b0bea536540106757bc4081e3)
sha256sums_aarch64=(60b5331f0f68e374df3e283744ca7b28b69015d388c432a4dbd14d3202ec6fce)
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

_z_binname="vendir"
_z_with_completion="true"
