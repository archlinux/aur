# Maintainer: tee < teeaur at duck dot com >

pkgname=rustunnel-bin
pkgver=0.8.8
pkgrel=1
pkgdesc='Self-hosted, secure tunnel server in Rust'
arch=(x86_64)
url='https://rustunnel.com'
license=(AGPL-3.0-or-later)
depends=(glibc libgcc)
provides=(rustunnel)
conflicts=(rustunnel)
_src='https://github.com/joaoh82/rustunnel'
source_x86_64=("$_src/releases/download/v$pkgver/rustunnel-v$pkgver-$arch-unknown-linux-gnu.tar.gz"
  "rustunnel-server-$pkgver::$_src/releases/download/v$pkgver/rustunnel-server-linux-$arch")
source=("$_src/releases/download/v$pkgver/rustunnel-v$pkgver-$arch-unknown-linux-gnu.tar.gz.sha256"
  "rustunnel-server-$pkgver.sha256::$_src/releases/download/v$pkgver/rustunnel-server-linux-$arch.sha256"
  "$_src/raw/v$pkgver/LICENSE"
  "$_src/raw/v$pkgver/deploy/rustunnel.service")
b2sums=('3e89f45a4f2672c8022eb55269c5b4380de42c082baa62d5ba93bc15340b37672c9d8da2bb386b17db6779064e25685de0b49202bed280210a75a44c71830c37'
        '0f96cd1e7130cad79c5eca05a8ffccfdc21949731c1d84e86c131df6a76be7dc8962b519f8415035093fc6bc62ba91ca244a5dd488e7006bee3b4d974485bf76'
        '6e6a9da9488406d5780cbf0952fde9f58dca76c394587b33b6d5eaa390c918b18b1aade7482bf4eb40f26235d56d509c81fe8a373819df5cedd001c338508ae0'
        '9b633d7fec46f2356de4c5d8d0f46cea983ea55fc8f6bbb3b106625d50db6bd8d264a821673e1114b07770b3ac07bdcae9d5a3f04d8e968795d3cab2f6eb33f0')
b2sums_x86_64=('1467ad3cdeb4d1f50ef7bb17763333cbed9120e851b6221f08751cc431089b8f3ac7d5c666b79cb163148b50c81a3b97c8c2a0a0724c241fa96878b7aa20b1ee'
               '13a1a05aeacf465e4afe30b80ad37fd3bbd8fdf429c4205ed49e55926634a6d8a52c8bbdcaf53da909020f197175305f97e4e0b1330748d7fc4333ee7181a08a')

package() {
  sed -i "s|/local||" rustunnel.service
  install -Dm644 rustunnel.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm755 rustunnel rustunnel-mcp -t "$pkgdir/usr/bin/"
  install -Dm755 rustunnel-server-$pkgver "$pkgdir/usr/bin/rustunnel-server"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
