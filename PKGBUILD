# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=imgpkg-bin
pkgver=0.49.0
pkgrel=1
pkgdesc='Store application configuration files in Docker/OCI registries'
url='https://carvel.dev/imgpkg'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(imgpkg)
provides=(imgpkg)
source_x86_64=(imgpkg-v0.49.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.49.0/imgpkg-linux-amd64)
source_aarch64=(imgpkg-v0.49.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.49.0/imgpkg-linux-arm64)
sha256sums_x86_64=(ea4d83bc88d5c9c6deda3951a80f621ea16769b94d4815edb1078399fdd9a5c3)
sha256sums_aarch64=(bd6200d76c28681328ad8636071730d76c8b6cfbc700b0c53477793ca1e0a0f4)
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
