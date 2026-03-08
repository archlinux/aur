# Maintainer: Michael Clayfield <me -at- michaelclayfield -dot- com>
# Contributor: Nicolas Martyanoff <nicolas@n16f.net>

pkgname="k3s-bin"
pkgver="1.35.2+k3s1"
pkgrel="1"
pkgdesc="Lightweight Kubernetes"
url="https://k3s.io"
license=("Apache")
arch=("x86_64" "armv7h" "aarch64")
conflicts=("k3s" "k3s-git")
backup=("etc/systemd/system/k3s.service.env")
options=('!debug')

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
sha256sums_x86_64=('3ae8e35a62ac83e8e197c117858a564134057a7b8703cf73e67ce60d19f4a22b')
sha256sums_armv7h=('18c1a5cd952fbc1946536d90a802df03d4cc99ccb9834cd9a80ba3f29d693449')
sha256sums_aarch64=('228809a7ef47d25c1bdbe746944931ec2fd2edf842b9cf50f1dd4f9ec2505b0e')




package() {
    install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

    install -dm 755 $pkgdir/usr/lib/systemd/system
    install -dm 755 $pkgdir/etc/systemd/system

    install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
    install -m 400 $srcdir/k3s.service.env $pkgdir/etc/systemd/system/k3s.service.env
}
