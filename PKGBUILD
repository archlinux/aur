# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=foxguard-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Fast universal code security scanner with built-in rules and external YAML support"
arch=('x86_64' 'aarch64')
url="https://foxguard.dev"
license=('MIT')
provides=('foxguard')
conflicts=('foxguard')
options=('!debug')
source=("LICENSE::https://raw.githubusercontent.com/0sec-labs/foxguard/v$pkgver/LICENSE")
sha256sums=('7c4f23d521b8c2e512af730ef2081c533c2c7e1438143b04758ad4bc9373fb97')
sha256sums_x86_64=('2ddb59b892836c85c38c7b100a3b714c950d04ad4762bd8b606bc7ec1482d000')
sha256sums_aarch64=('a0a6bebf632dfe27b8d5a1d0a86c01782424d4cadc1981f6bf5de2649fd298fc')

source_x86_64=("foxguard-$pkgver-x86_64::https://github.com/0sec-labs/foxguard/releases/download/v$pkgver/foxguard-linux-x86_64")

source_aarch64=("foxguard-$pkgver-aarch64::https://github.com/0sec-labs/foxguard/releases/download/v$pkgver/foxguard-linux-aarch64")
noextract=("foxguard-$pkgver-x86_64" "foxguard-$pkgver-aarch64")

package() {
  install -Dm755 "foxguard-$pkgver-$CARCH" "$pkgdir/usr/bin/foxguard"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

latestver() {
  curl -fsSL 'https://api.github.com/repos/0sec-labs/foxguard/releases/latest' |
    sed -nE 's/.*"tag_name": "v([0-9]+(\.[0-9]+)*)".*/\1/p'
}
