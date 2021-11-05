# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>

pkgname="k3s-bin"
pkgver="1.22.3+k3s1"
pkgrel="1"
pkgdesc="Lightweight Kubernetes"
url="https://k3s.io"
license=("Apache")
arch=("x86_64" "armv7h" "aarch64")
conflicts=("k3s-git")

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
    "f4ae496b69b3dd376a28298df50297728a47761b041be522adf2537aa8a8c3d8"
    "667199fa6b811dde3aef3e626e2695a566ad64c9a03d19d0c94a1f104a7612d0"
)

sha256sums_x86_64=(
    "b22f0a1c18a62b58137759d419a0e077eed640c6784425756c5f04910d6a6866"
)

sha256sums_armv7h=(
    "f5bd416e2b760461c07b8419a4d6e89784325bcd6b7b125fa4c6ea8ac0625a31"
)

sha256sums_aarch64=(
    "3185cc41b8fc8a1e35ea8d92a11da82f0d6e64fa6e2eac5818dffb8ff1dd1363"
)

package() {
    install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

    install -dm 755 $pkgdir/usr/lib/systemd/system
    install -dm 755 $pkgdir/etc/systemd/system

    install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
    install -m 400 $srcdir/k3s.service.env $pkgdir/etc/systemd/system/k3s.service.env
}
