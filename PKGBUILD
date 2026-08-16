# Maintainer: tee < teeaur at duck dot com >
pkgname=rayfish-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="P2P mesh VPN powered by iroh"
arch=(x86_64)
url='https://rayfish.xyz'
license=(MPL-2.0)
provides=(rayfish)
conflicts=(rayfish)
source=("rayfish-$pkgver.sha256::https://github.com/rayfish/rayfish/releases/download/v$pkgver/ray-linux-x86_64.sha256"
  "https://github.com/rayfish/rayfish/raw/v$pkgver/contrib/rayfish.service")
source_x86_64=("rayfish-$pkgver::https://github.com/rayfish/rayfish/releases/download/v$pkgver/ray-linux-x86_64")
b2sums=(SKIP
        'f468b96d7596587fbb9cfd3701a431b5422c107888c7cfb7eac31228d70ed6110c91a8f5fdeb2f2b513d3f62716b20f651cfc8bd7bcfb7b88fbaf998d698f992')
b2sums_x86_64=('993f94a93bb903d86c8c510f1117332a8304eca5b6e966c2847fd54234ec5faff2d818aaeeae99ed201476afe38aff1761afdcadd1a40dc36399bda07456f543')

package() {
  install -Dm755 "rayfish-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
