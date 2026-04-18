# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kbld-bin
pkgver=0.47.3
pkgrel=1
pkgdesc='kbld seamlessly incorporates image building and image pushing into your development and deployment workflows'
url='https://carvel.dev/kbld'
arch=(x86_64 aarch64)
license=(apache-2.0)
install=''
conflicts=(kbld)
provides=(kbld)
source_x86_64=(kbld-v0.47.3::https://github.com/carvel-dev/kbld/releases/download/v0.47.3/kbld-linux-amd64)
source_aarch64=(kbld-v0.47.3::https://github.com/carvel-dev/kbld/releases/download/v0.47.3/kbld-linux-arm64)
sha256sums_x86_64=(26be68f9ec354a2753f102707f4389e28111d36c2a318b72cd1bcff719fabb6c)
sha256sums_aarch64=(e985d62a8539ca2386c0e3db0e2c357adf55a4fdd0fa0e4ad7ab48a852c11ab1)
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

_z_binname="kbld"
_z_with_completion="false"
