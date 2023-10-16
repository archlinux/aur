# Maintainer: Duologic <jeroen@simplsitic.be>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=vcluster-bin
_pkgname=vcluster
pkgdesc='Create fully functional virtual Kubernetes clusters'
pkgver=0.16.3
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
    'ad5e8b909f60db8bb864abb9d31221d6767268437d454bb2cd2c78209fcaf642'
)
sha256sums_armv7l=(
    'a48477baf03fa377a65f84d9069a13179f03ea7e94fdc29ed521e7c91a793fbb'
)
sha256sums_armv7h=(
    "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
    '1b2279205f7494df3d723ece8e46ea93026083077b53d79c2b1fd56d087f86ed'
)

package() {
    install -D -m0755 "$srcdir/vcluster-$pkgver" "$pkgdir/usr/bin/$_pkgname"

    "$pkgdir/usr/bin/vcluster" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    "$pkgdir/usr/bin/vcluster" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
