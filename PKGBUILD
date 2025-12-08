# Maintainer: Michael Clayfield <me -at- michaelclayfield -dot- com>
# Contributor: Nicolas Martyanoff <nicolas@n16f.net>

pkgname="k3s-bin"
pkgver="1.34.2+k3s1"
pkgrel="1"
pkgdesc="Lightweight Kubernetes"
url="https://k3s.io"
license=("Apache")
arch=("x86_64" "armv7h" "aarch64")
conflicts=("k3s" "k3s-git")
backup=("etc/systemd/system/k3s.service.env")

source=(
    "k3s.service"
    "k3s.service.env"
)

source_x86_64=(
    "k3s-${pkgver}-x86_64::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s"
)

source_armv7h=(
    "k3s-${pkgver}-armv7h::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s-armhf"
)

source_aarch64=(
    "k3s-${pkgver}-aarch64::https://github.com/rancher/k3s/releases/download/v${pkgver}/k3s-arm64"
)

sha256sums=('6dae4b76712fc5ad7e515ad8a14fee0b961bfb0cd624d998ac954c233aa90ff5'
            '667199fa6b811dde3aef3e626e2695a566ad64c9a03d19d0c94a1f104a7612d0')
sha256sums_x86_64=('15811d34187e03fe29d0e46108c42cc33e62cec1b3d9d80f50944536ebcad40a')
sha256sums_armv7h=('8824bf5f2af87ecb05575d1712325615968c073b022c6178e5356887c2f1eff7')
sha256sums_aarch64=('2e1db0e54a8b0d0ab8a264a119c9c617561f9290e7bb2722d795f8bc91b24cf8')




package() {
    install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

    install -dm 755 $pkgdir/usr/lib/systemd/system
    install -dm 755 $pkgdir/etc/systemd/system

    install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
    install -m 400 $srcdir/k3s.service.env $pkgdir/etc/systemd/system/k3s.service.env
}
