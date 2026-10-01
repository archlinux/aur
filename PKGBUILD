# Maintainer: Michael Clayfield <me -at- michaelclayfield -dot- com>
# Contributor: Nicolas Martyanoff <nicolas@n16f.net>

pkgname="k3s-bin"
pkgver="1.37.1+k3s1"
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
sha256sums_x86_64=('92b94582eb7b34a8cf532e6006842b9ed215a6783cf56a3dd6271fd35243b2c0')
sha256sums_armv7h=('bc9f5d9c681cbf0f3817de7089b013d5ae9ede08f4b3a588491978f168722d63')
sha256sums_aarch64=('a1561ca4aef8b99f5588a840d4468ac39c8c1cd92470bbcb9634823fa221741a')




package() {
    install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

    install -dm 755 $pkgdir/usr/lib/systemd/system
    install -dm 755 $pkgdir/etc/systemd/system

    install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
    install -m 400 $srcdir/k3s.service.env $pkgdir/etc/systemd/system/k3s.service.env
}
