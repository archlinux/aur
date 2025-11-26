# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=imgpkg-bin
pkgver=0.47.0
pkgrel=1
pkgdesc='Store application configuration files in Docker/OCI registries'
url='https://carvel.dev/imgpkg'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(imgpkg)
provides=(imgpkg)
source_x86_64=(imgpkg-v0.47.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.47.0/imgpkg-linux-amd64)
source_aarch64=(imgpkg-v0.47.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.47.0/imgpkg-linux-arm64)
sha256sums_x86_64=(7602b6af24a818265dcb2cc0dc7f6117a3591f26e2c266f294800f99ae433da1)
sha256sums_aarch64=(14d0083027eeba54a4804c561fb41d0c723f908ec91e073e88f3a64c52b54544)
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
