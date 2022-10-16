# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>

pkgname="k3s-bin"
pkgver="1.25.2+k3s1"
pkgrel="1"
pkgdesc="Lightweight Kubernetes"
url="https://k3s.io"
license=("Apache")
arch=("x86_64" "armv7h" "aarch64")
conflicts=("k3s-git")
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

sha256sums=(
    "6dae4b76712fc5ad7e515ad8a14fee0b961bfb0cd624d998ac954c233aa90ff5"
    "667199fa6b811dde3aef3e626e2695a566ad64c9a03d19d0c94a1f104a7612d0"
)

sha256sums_x86_64=(
    "1f76cfc0b8434a7eaa665dffcd016e477a2cff47f7ee2d4a3b7a3db23b05eff6"
)

sha256sums_armv7h=(
    "d7863a57ac231e9db18ed58ff2c489cbce6e6fcfe40d536268cc6640ac7e7a32"
)

sha256sums_aarch64=(
    "cfae82ed3fef3973756b2cd8a195506d09f95ed8b2327827a312be11d4f414bb"
)

package() {
    install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

    install -dm 755 $pkgdir/usr/lib/systemd/system
    install -dm 755 $pkgdir/etc/systemd/system

    install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
    install -m 400 $srcdir/k3s.service.env $pkgdir/etc/systemd/system/k3s.service.env
}
