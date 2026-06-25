# Maintainer: Duologic <jeroen@simplsitic.be>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=vcluster-bin
_pkgname=vcluster
pkgdesc='Create fully functional virtual Kubernetes clusters'
pkgver=0.35.1
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

sha256sums_x86_64=('baf9effb1de7c17cfa4462aacf92d913b4ec4e359c6e711e33c43f7e5e5b0dab')
sha256sums_aarch64=('baf9effb1de7c17cfa4462aacf92d913b4ec4e359c6e711e33c43f7e5e5b0dab')

package() {
    install -D -m0755 "$srcdir/vcluster-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    "$pkgdir/usr/bin/vcluster" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    "$pkgdir/usr/bin/vcluster" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
