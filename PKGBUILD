# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=foxguard-bin
pkgver=0.14.2
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
sha256sums_x86_64=('6996b73f5bd60eaa173908e585808a4df63595e09be34b1d7a5a70457a0ebec8')
sha256sums_aarch64=('db6df4e455740488efef3be01df2217f825e0878ff1e4288e945db2133cabb7c')

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
