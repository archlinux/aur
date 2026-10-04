# Maintainer: tee < teeaur at duck dot com >
pkgname=rayfish-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="P2P mesh VPN powered by iroh"
arch=(x86_64 aarch64)
url='https://rayfish.xyz'
license=(MPL-2.0)
provides=(rayfish)
conflicts=(rayfish)
source=("https://github.com/rayfish/rayfish/raw/v$pkgver/contrib/rayfish.service")
source_x86_64=("rayfish-$CARCH-$pkgver.sha256::https://github.com/rayfish/rayfish/releases/download/v$pkgver/ray-linux-x86_64.sha256"
"rayfish-$CARCH-$pkgver::https://github.com/rayfish/rayfish/releases/download/v$pkgver/ray-linux-x86_64")
source_aarch64=("rayfish-aarch64-$pkgver.sha256::https://github.com/rayfish/rayfish/releases/download/v$pkgver/ray-linux-aarch64.sha256"
"rayfish-aarch64-$pkgver::https://github.com/rayfish/rayfish/releases/download/v$pkgver/ray-linux-aarch64")
b2sums=('f468b96d7596587fbb9cfd3701a431b5422c107888c7cfb7eac31228d70ed6110c91a8f5fdeb2f2b513d3f62716b20f651cfc8bd7bcfb7b88fbaf998d698f992')
b2sums_x86_64=('84ec0d0061e954cc4c1e1ec5204fa6d35e8d9ae17a38da7bed4cc88c381b7b896a1660033c58cc20e716035771e1fa49c36626baa475aad11aeb28fb4aab926a'
               '0648b63ed72839f59c400f3137799e9f07a925a7cce8451a70d25b907446fd9172e5f63226239240ed9aaf7221b5292e7fcb11bf92b19b57da407c01be9f8579')
b2sums_aarch64=('ff50d444e65a48f1b4991e675c8e58e5ab71b9a6cc628495fd5344f4b3ff0bc8bedd7c728b23dd3c1afed7104bce9f4c56bb54050d2b9b7586f57ca953200c5e'
                '65a08a5a363636f5095e9df57fe55bcddcf8a8c17ffafea799c2c48eaaf6576e2c31408442ebec83fb2761c501989c8b1518fe343e99aeaf95d333f1f12d40dd')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
