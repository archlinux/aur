# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>

pkgname=openshell-bin
pkgver=0.0.92
pkgrel=1
pkgdesc='The safe, sandboxed runtime for autonomous AI agents'
arch=('x86_64' 'aarch64')
url='https://github.com/NVIDIA/OpenShell'
license=('Apache-2.0')
depends=('glibc' 'libgcc')
optdepends=(
  'podman'
  'docker'
  'e2fsprogs'
  'iproute2'
  'nftables'
)
optdepends_x86_64=(
  'qemu-system-x86'
)
provides=("openshell=$pkgver")
conflicts=('openshell')
options=('!strip' '!debug')

source=(
  "LICENSE-$pkgver::https://raw.githubusercontent.com/NVIDIA/OpenShell/v$pkgver/LICENSE"
  "openshell-gateway-$pkgver.service::https://raw.githubusercontent.com/NVIDIA/OpenShell/v$pkgver/deploy/deb/openshell-gateway.service"
)
sha256sums=(
  'b967d1c87b93b7d61ebcf4f8737e6ad79e5433e743e49dff395a36fb3c327047'
  '3d17362f716e2d74737f285c660653cffc89663cb696dcc55a68cdf8b2de8669'
)

source_x86_64=(
  "openshell-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-x86_64-unknown-linux-musl.tar.gz"
  "openshell-gateway-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-gateway-x86_64-unknown-linux-gnu.tar.gz"
  "openshell-sandbox-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-sandbox-x86_64-unknown-linux-gnu.tar.gz"
  "openshell-driver-vm-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-driver-vm-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=(
  'db1a86fadea9c5483aef291fabd4ea1dfeacea908faa450952f2ab01de5f4035'
  'fa2af2a893d25dfa7ec634bf98118c9a36fc368fca9785b7d17183388c31aaf5'
  'e87c67bd71ba64744e73dbf89c7c1a175c6bb26233769a6f7f5988177d0540d5'
  '2c7fe7b47aa2a14315bf47747006ea81839c50c6656df8790f2e7c4e499e8368'
)

source_aarch64=(
  "openshell-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-aarch64-unknown-linux-musl.tar.gz"
  "openshell-gateway-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-gateway-aarch64-unknown-linux-gnu.tar.gz"
  "openshell-sandbox-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-sandbox-aarch64-unknown-linux-gnu.tar.gz"
  "openshell-driver-vm-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-driver-vm-aarch64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=(
  'a0352669b4a9583c5fbe26610d0afa4db56ab9283c4a603740e1261222de7e39'
  'beb34794e7e69931f254cddcb023da5fa26ef6abd032885dc2cb786a034274eb'
  '2710948844b2415e1f178b58c28a9f79e25d46cd0c5409a8c057c08910cb4bd4'
  '3b94474f66db9ef6d34d722168428daed616867d0d87c46ec9c09f889e35ea29'
)

check() {
  "$srcdir/openshell" --version | grep -Fx "openshell $pkgver"
  "$srcdir/openshell-gateway" --version | grep -Fx "openshell-gateway $pkgver"
  "$srcdir/openshell-sandbox" --version | grep -Fx "openshell-sandbox $pkgver"
  "$srcdir/openshell-driver-vm" --version | grep -Fx "openshell-driver-vm $pkgver"
}

package() {
  install -Dm755 "$srcdir/openshell" \
    "$pkgdir/usr/bin/openshell"

  install -Dm755 "$srcdir/openshell-gateway" \
    "$pkgdir/usr/bin/openshell-gateway"

  install -Dm755 "$srcdir/openshell-sandbox" \
    "$pkgdir/usr/bin/openshell-sandbox"

  install -Dm755 "$srcdir/openshell-driver-vm" \
    "$pkgdir/usr/bin/openshell-driver-vm"

  install -Dm644 "$srcdir/openshell-gateway-$pkgver.service" \
    "$pkgdir/usr/lib/systemd/user/openshell-gateway.service"

  install -Dm644 "$srcdir/LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
