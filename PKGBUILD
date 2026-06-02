# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=vendir-bin
pkgver=0.45.4
pkgrel=1
pkgdesc='Easy way to vendor portions of git repos, github releases, helm charts, docker image contents, etc. declaratively'
url='https://carvel.dev/vendir'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(vendir)
provides=(vendir)
source_x86_64=(vendir-v0.45.4::https://github.com/carvel-dev/vendir/releases/download/v0.45.4/vendir-linux-amd64)
source_aarch64=(vendir-v0.45.4::https://github.com/carvel-dev/vendir/releases/download/v0.45.4/vendir-linux-arm64)
sha256sums_x86_64=(b71189f46b26facc6d5baeae8047fe49afd899f8125818275241a084aa2c08a1)
sha256sums_aarch64=(25847a9d58c44cca6f486d7c31199a2a2e15bc1be1e8adafae66a01411ea222e)
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
