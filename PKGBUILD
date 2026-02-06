# Maintainer: Michael Clayfield <me -at- michaelclayfield -dot- com>
# Contributor: Nicolas Martyanoff <nicolas@n16f.net>

pkgname="k3s-bin"
pkgver="1.35.0+k3s3"
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
sha256sums_x86_64=('cf99be0b6562545f7f9d2c35ee9f3f2933a42e6598762b93f5b38e072d5bff77')
sha256sums_armv7h=('d0a382d98f4ece86ba602c0a252543bff2b9b9c504828c00dc698b17e3d434c6')
sha256sums_aarch64=('9f45d76e52eb79a28a89336a34e5324c7e729409249422b37372ebb19198a228')




package() {
    install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

    install -dm 755 $pkgdir/usr/lib/systemd/system
    install -dm 755 $pkgdir/etc/systemd/system

    install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
    install -m 400 $srcdir/k3s.service.env $pkgdir/etc/systemd/system/k3s.service.env
}
