# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>

pkgname="k3s-bin"
pkgver="1.21.4+k3s1"
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
    "47e686ad5390670da79a467ba94399d72e472364bc064a20fecd3937a8d928b5"
)

sha256sums_armv7h=(
    "208bef525bf968b6b55a2fcb358cf626464e978c99111a1c444f6fad3dd44e06"
)

sha256sums_aarch64=(
    "b7f8c026c5346b3e894d731f1dc2490cd7281687549f34c28a849f58c62e3e48"
)

package() {
  install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system
  install -dm 755 $pkgdir/etc/systemd/system

  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
  install -m 400 $srcdir/k3s.service.env $pkgdir/etc/systemd/system/k3s.service.env
}
