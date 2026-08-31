# Maintainer: tee < teeaur at duck dot com >
pkgname=rayfish-bin
pkgver=0.4.0
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
b2sums_x86_64=('SKIP'
               '03379d59ad93919896a3884f0e61b3dcd0bc415a4aa90507d5ef49bd6b8c15aefe8108ac4ec49d575ba55a4839e7d7db01ea9e10d781adb6ecbdbc603cb8801d')
b2sums_aarch64=('SKIP'
                '425eff8baffda5858aa841e68e3ea21c401fa11852115c8412a07e2dcdb1f07713aca31871f3ef0d9174ab36ffa483c3cbce74d9b182134df2c5e9fdb885ae73')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
