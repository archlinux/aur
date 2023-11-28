# Maintainer: Duologic <jeroen@simplsitic.be>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=vcluster-bin
_pkgname=vcluster
pkgdesc='Create fully functional virtual Kubernetes clusters'
pkgver=0.17.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://vcluster.com"
license=('apache')
provides=(vcluster)
conflicts=(vcluster)

source_x86_64=(
    "vcluster-$pkgver::https://github.com/loft-sh/vcluster/releases/download/v${pkgver}/vcluster-linux-amd64"
)
source_armv7l=(
    "vcluster-$pkgver::https://github.com/loft-sh/vcluster/releases/download/v${pkgver}/vcluster-linux-arm"
)
source_armv7h=(
    "${source_armv7l}"
)
source_aarch64=(
    "vcluster-$pkgver::https://github.com/loft-sh/vcluster/releases/download/v${pkgver}/vcluster-linux-arm64"
)

sha256sums_x86_64=(
    'a5a117be78c70c7be5a94cdc40ea6a0cf49cf8f2ef0bc060a4c78dce3abf60ef'
)
sha256sums_armv7l=(
    'd6211f88fe88287697e44041c9ef5b461732322c04f85ec5d16ad555d6c9bd17'
)
sha256sums_armv7h=(
    "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
    '8aac57a6fef3ede9279a3768c49133fd17d0c73d9b8151cb4dc79823fc4d10fd'
)

package() {
    install -D -m0755 "$srcdir/vcluster-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    "$pkgdir/usr/bin/vcluster" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    "$pkgdir/usr/bin/vcluster" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
