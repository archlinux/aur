# Maintainer: Duologic <jeroen@simplsitic.be>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=vcluster-bin
_pkgname=vcluster
pkgdesc='Create fully functional virtual Kubernetes clusters'
pkgver=0.34.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://vcluster.com"
license=('apache')
provides=(vcluster)
conflicts=(vcluster)

source_x86_64=(
    "vcluster-$pkgver::https://github.com/loft-sh/vcluster/releases/download/v${pkgver}/vcluster-linux-amd64"
)
source_aarch64=(
    "vcluster-$pkgver::https://github.com/loft-sh/vcluster/releases/download/v${pkgver}/vcluster-linux-arm64"
)

sha256sums_x86_64=(
    'af4616d0725c34594e70ada54dd0c917cadacde45307c5f3c3ae0d44ba03675c'
)
sha256sums_aarch64=(
    '9db958821c1d78c5bd090dcc5502a728a444258cfa6a414d019220a0c2e2b796'
)

package() {
    install -D -m0755 "$srcdir/vcluster-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    "$pkgdir/usr/bin/vcluster" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    "$pkgdir/usr/bin/vcluster" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
