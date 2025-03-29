# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=vendir-bin
pkgver=0.43.1
pkgrel=1
pkgdesc='Easy way to vendor portions of git repos, github releases, helm charts, docker image contents, etc. declaratively'
url='https://carvel.dev/vendir'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(vendir)
provides=(vendir)
source_x86_64=(vendir-v0.43.1::https://github.com/carvel-dev/vendir/releases/download/v0.43.1/vendir-linux-amd64)
source_aarch64=(vendir-v0.43.1::https://github.com/carvel-dev/vendir/releases/download/v0.43.1/vendir-linux-arm64)
sha256sums_x86_64=(540d146faad93e1ba8962bb2367b6ad64ab504750ec7efd8a1a558fca4c7f392)
sha256sums_aarch64=(89584179518d8810dd305607798d9c20fd3d97a9153735991f942a15d9f31d33)
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
