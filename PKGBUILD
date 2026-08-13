# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>

pkgname=openshell-bin
pkgver=0.0.104
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
sha256sums_x86_64=('a8db262ad9af996a3d9203fcc3d7ba90fe2c6cb0f3fffc9b7d1b9b44cd27df22'
                   '577fc5cb9ef64bc0c1afc9b8fc85cdfe9ef546ebf40794085b31d78200928bb1'
                   'a02d2e5a3d0d7e2a399162b269cc2bf148829851f7469d437ba6ee95c3de7324'
                   '763d4f9d2c7584f92ac8054c218447d4e38a088e644397931ec2cd680284fa8d')
sha256sums_aarch64=('c55d4096e82b6044e246ce26fb8fd7df9f1a701ff8b117dc3d84f0761e7a5082'
                    'd0197aace3f9783804b66882027d4a3f41b50e327e36c1fd225b54b3d1964dd1'
                    'df5491cfeba8f9195cb03c85d5d79753edfcdc23e4658e1b002338c744fece9b'
                    '0453dad87c0b96d5f029787f2341d12f8e9e2079647ed99140cc385243c84686')

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
