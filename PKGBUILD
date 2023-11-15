# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=vendir-bin
pkgver=0.37.0
pkgrel=2
pkgdesc='Easy way to vendor portions of git repos, github releases, helm charts, docker image contents, etc. declaratively'
url='https://carvel.dev/vendir'
arch=(x86_64 aarch64)
license=(apache-2.0)
provides=(vendir)
source_x86_64=(vendir-v0.37.0::https://github.com/carvel-dev/vendir/releases/download/v0.37.0/vendir-linux-amd64)
source_aarch64=(vendir-v0.37.0::https://github.com/carvel-dev/vendir/releases/download/v0.37.0/vendir-linux-arm64)
sha256sums_x86_64=(f1472bf7995506830fa79473f0ae406ea3885e0881fbbb096240efb1b053dd15)
sha256sums_aarch64=(7dde14730aa5a58511fc5b95f61162892ec97f87c9a57c01ab91d1f9f3d7aa74)
package () 
{ 
    install -Dm 755 "${srcdir}/${_z_binname}-v${pkgver}" "${pkgdir}/usr/bin/${_z_binname}";
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    ./$_z_binname completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_z_binname";
    ./$_z_binname completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_z_binname.fish";
    ./$_z_binname completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_z_binname"
}


# Custom variables

_z_binname="vendir"
