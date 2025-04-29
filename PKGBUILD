# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=imgpkg-bin
pkgver=0.46.0
pkgrel=1
pkgdesc='Store application configuration files in Docker/OCI registries'
url='https://carvel.dev/imgpkg'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(imgpkg)
provides=(imgpkg)
source_x86_64=(imgpkg-v0.46.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.46.0/imgpkg-linux-amd64)
source_aarch64=(imgpkg-v0.46.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.46.0/imgpkg-linux-arm64)
sha256sums_x86_64=(e21cb5f3ff185b6a5e93ce6114cd7120e8bafe658916a1b549d7c54fce806ced)
sha256sums_aarch64=(a57004ab4a52c3e9b3b1c2eeab76113b3cbffaa46142f56261bbf2d2fedc182a)
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

_z_binname="imgpkg"
_z_with_completion="true"
