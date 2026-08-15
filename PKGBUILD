# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>

pkgname=openshell-bin
pkgver=0.0.106
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
sha256sums_x86_64=('d1a885a91b3e5aaa006c36aca95dc78bed0638c1ba1a79b55f1da93211b8a0a0'
                   'b7760cb752a4363c2f21d32298dd0c683dc438f6edfd16c2e4242bc0baefbb7c'
                   '559b8aaad3a8eeab45c511e7de531d9baa98a311282dcb0c2c5f38cc2d4ca355'
                   '1c86ad15a65b5997857443ffd737d549fe155432a5053b6102fd76829efc57aa')
sha256sums_aarch64=('ce981904ae8febd9cd6b3fbceb04e1dcfb48da6042bac08eadf0c2211f83fe55'
                    '22b7781249e3487085694d0f0f3797a0e549018b81144cd24b2f1118c730d1c7'
                    '5e5d758d53c6abc6d7a936be907dafa9dfce10423289536f39b50abe294dfafd'
                    'b7b0fd93ce95a435b955d34b023128499ca8fc4b98228a0282c677fdb0168a01')

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
