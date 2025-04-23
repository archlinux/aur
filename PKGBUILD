# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kctrl-bin
pkgver=0.56.1
pkgrel=1
pkgdesc='Continuous delivery and package management for Kubernetes.'
url='https://carvel.dev/kapp-controller'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(kctrl)
provides=(kctrl)
source_x86_64=(kctrl-v0.56.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.56.1/kctrl-linux-amd64)
source_aarch64=(kctrl-v0.56.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.56.1/kctrl-linux-arm64)
sha256sums_x86_64=(0adb8e1060fbd3b9cc7c4f926863732ac0be2ae1e746e7232f0e5cd61da00b34)
sha256sums_aarch64=(43a11bed3e52028b268aa101cc546c915adc5bc3ab586bdad01a6f4fde554bd1)
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
