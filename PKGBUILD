# Maintainer: tee < teeaur at duck dot com >
pkgname=rayfish-bin
pkgver=0.5.9
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
b2sums_x86_64=('1888150fbdae118e76514d42cd2a0da335b36bc1009d74e5bbd553266623224bf7589d7ea66ae1c3a6e35a409b0b415c826a92dcb361a1a2520458c7e08f2520'
               'bda5683e34851bfa7bf0792296fdf05e20c5e09e23a71b3aa758462ebe32faae7d5aa26604cfb51fe29b7a48937ce40616a2d7168f6f09f114e20c4719b8d896')
b2sums_aarch64=('6a86e7d315e5397742403aacc52f0e8d9fa5fccf50aa6b87323877f055c61a5e38579b27b61e03e17ea50dac109b28a8ebc7fd129c1415ef007cd4b9c1a90566'
                'c9476024441c561859f320455096d43a53045004f6d6b539e30d60060096e18d2e4c0330d085dd762e1b52dcda1285819e82429b569d57d3fc02d1b0d032b400')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
