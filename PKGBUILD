# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>

pkgname=openshell-bin
pkgver=0.0.109
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
sha256sums=('b967d1c87b93b7d61ebcf4f8737e6ad79e5433e743e49dff395a36fb3c327047'
            '3d17362f716e2d74737f285c660653cffc89663cb696dcc55a68cdf8b2de8669')
sha256sums_x86_64=('4e2db09d50e764cf92437a523f2074c884c743598b543a1194a49b35f5f73ed5'
                   'f5cb2ec25e948098ddf2eb1efdf30a017d39135376e54638168985f0d8be4897'
                   '2616d4c92b233783958d47d68964c75ad2c42dae00c852756eea775cc8500669'
                   '44ca09b8758cf9b9e4aa439cebe66610479f932c76002078a239c8faeea71702')
sha256sums_aarch64=('e93908ff208236af64614aa740c4a232b74326957abe95940930d195e908bd07'
                    'b1bb28f8909e06ed3b578c54988337c8d111872737c2bb7070b624394c03c3c0'
                    'dd24e24c254ea3fa9f44eb8efda0f3e21cac5f793253c1988e45edf82034730a'
                    'd9356f91c6c5269b99e19897fb15a95ad6db9a56dc8cd53b0b236ae8b66d6ea9')

source_x86_64=(
  "openshell-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-x86_64-unknown-linux-musl.tar.gz"
  "openshell-gateway-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-gateway-x86_64-unknown-linux-gnu.tar.gz"
  "openshell-sandbox-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-sandbox-x86_64-unknown-linux-gnu.tar.gz"
  "openshell-driver-vm-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-driver-vm-x86_64-unknown-linux-gnu.tar.gz"
)

source_aarch64=(
  "openshell-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-aarch64-unknown-linux-musl.tar.gz"
  "openshell-gateway-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-gateway-aarch64-unknown-linux-gnu.tar.gz"
  "openshell-sandbox-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-sandbox-aarch64-unknown-linux-gnu.tar.gz"
  "openshell-driver-vm-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-driver-vm-aarch64-unknown-linux-gnu.tar.gz"
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
