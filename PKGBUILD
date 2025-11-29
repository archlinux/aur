# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kapp-bin
pkgver=0.65.0
pkgrel=1
pkgdesc='kapp is a simple deployment tool focused on the concept of "Kubernetes application" — a set of resources with the same label'
url='https://carvel.dev/kapp'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(kapp)
provides=(kapp)
source_x86_64=(kapp-v0.65.0::https://github.com/carvel-dev/kapp/releases/download/v0.65.0/kapp-linux-amd64)
source_aarch64=(kapp-v0.65.0::https://github.com/carvel-dev/kapp/releases/download/v0.65.0/kapp-linux-arm64)
sha256sums_x86_64=(9cb88745d189bbfe2423771d68f50f7222ca33187350470857cca124d3341233)
sha256sums_aarch64=(c7be5fdbbc22d9efc7cb952c13c1e671a632af8530e7958eda89ff010cac78d3)
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
