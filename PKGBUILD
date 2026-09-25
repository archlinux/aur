# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kctrl-bin
pkgver=0.60.9
pkgrel=1
pkgdesc='Continuous delivery and package management for Kubernetes.'
url='https://carvel.dev/kapp-controller'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(kctrl)
provides=(kctrl)
source_x86_64=(kctrl-v0.60.9::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.9/kctrl-linux-amd64)
source_aarch64=(kctrl-v0.60.9::https://github.com/carvel-dev/kapp-controller/releases/download/v0.60.9/kctrl-linux-arm64)
sha256sums_x86_64=(842ea6448d712b103e60b2e2acd91ddc7bda7ba789793af793d7899a64e2c2b0)
sha256sums_aarch64=(478fb543a435a5761c303a1929bd8f81cab475d03abec06a6b4902121e1d86e1)
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

_z_binname="kctrl"
_z_with_completion="false"
