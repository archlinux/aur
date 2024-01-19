# Maintainer: Duologic <jeroen@simplsitic.be>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=vcluster-bin
_pkgname=vcluster
pkgdesc='Create fully functional virtual Kubernetes clusters'
pkgver=0.18.1
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
    'fc85905e7bd55494b896dac2b269bae60dd8ec2ba37528d7d4fa3e75e2ba0432'
)
sha256sums_armv7l=(
    '1d6975fe7d6b41b9d9231a112b5ddf7fd4829c9f26c72d78d6096a556b4d9633'
)
sha256sums_armv7h=(
    "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
    '51bbe40dd9b8a8b1388146822e4279852bcba2422cc5f7e594f492586eb4101e'
)

package() {
    install -D -m0755 "$srcdir/vcluster-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    "$pkgdir/usr/bin/vcluster" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    "$pkgdir/usr/bin/vcluster" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
