# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>

pkgname=openshell-bin
pkgver=0.0.110
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
sha256sums_x86_64=('d985396a5556ae7dd1f1c37663d0435015cb57240a92e194baacc19573c4a589'
                   '3b68fb7758c49ca352ac45a092c67c376b1710a28af9f9a35b14e67de60ab9a3'
                   '8c4d1ddfcfa372cc39b913673abd04035a9a29a52e655940db1256b45f97be3a'
                   '54e18d80702b4573642bb1ecc32855585a161ce7167b4e7381f523b61fd4770b')
sha256sums_aarch64=('c440fb5e86d66ff3dc45f25ff41158a3eb4a27eb55a7bfc0af37817a33a6b842'
                    '8427377c56d52bfd5c49ccf2175526d8fb7fd50e6d40dd91d4a8357e4a3f1393'
                    'a749f778557458de95493688043563bc53c545c4037d1bd36229f607972c8897'
                    '780ea8b80d5160d8d79d953cd741cd8e8793fcaa6a63b75d712b22c4d3b0479a')

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
