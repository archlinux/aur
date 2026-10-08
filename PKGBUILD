# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=imgpkg-bin
pkgver=0.48.3
pkgrel=1
pkgdesc='Store application configuration files in Docker/OCI registries'
url='https://carvel.dev/imgpkg'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(imgpkg)
provides=(imgpkg)
source_x86_64=(imgpkg-v0.48.3::https://github.com/carvel-dev/imgpkg/releases/download/v0.48.3/imgpkg-linux-amd64)
source_aarch64=(imgpkg-v0.48.3::https://github.com/carvel-dev/imgpkg/releases/download/v0.48.3/imgpkg-linux-arm64)
sha256sums_x86_64=(d177073901136b1e07741c9c7e6afdbdf8b4bcf32017c1e5bc8d184c8383ec69)
sha256sums_aarch64=(655609325d9497096546342a4683688fc2a87a2952542b5da8105838285ec079)
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
