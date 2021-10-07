# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>

pkgname="k3s-bin"
pkgver="1.22.2+k3s2"
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
    "567e5838dc9d0346ea1aae55b917ee557d3a7b89947de5038eb41a500d87f0d7"
)

sha256sums_armv7h=(
    "a9905f871bc5e156ed0608c9c4a664e51254811b33405d2ac2ab04f529a78cad"
)

sha256sums_aarch64=(
    "f7c944bec1f4ec9eeb7b9726b7c0aae203bf7f3cd89bafd3c1c60353d066941d"
)

package() {
  install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

  install -dm 755 $pkgdir/usr/lib/systemd/system
  install -dm 755 $pkgdir/etc/systemd/system

  install -m 644 $srcdir/k3s.service $pkgdir/usr/lib/systemd/system/k3s.service
  install -m 400 $srcdir/k3s.service.env $pkgdir/etc/systemd/system/k3s.service.env
}
