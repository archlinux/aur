# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=imgpkg-bin
pkgver=0.39.0
pkgrel=4
pkgdesc='Store application configuration files in Docker/OCI registries'
url='https://carvel.dev/imgpkg'
arch=(x86_64 aarch64)
license=(apache-2.0)
provides=(imgpkg)
source_x86_64=(imgpkg-v0.39.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.39.0/imgpkg-linux-amd64)
source_aarch64=(imgpkg-v0.39.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.39.0/imgpkg-linux-arm64)
sha256sums_x86_64=(98b80baa5d665c5119fc8e2a62978f9d193c9647e3c47ab72867b055b94d14ff)
sha256sums_aarch64=(7b247c24850dbf4ff70095b6d7f5aff12aea15d0ece9e9ecf66f92e3c9d2f332)
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

_z_binname="imgpkg"
