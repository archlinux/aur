# Maintainer: tee < teeaur at duck dot com >
pkgname=rayfish-bin
pkgver=0.4.2
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
b2sums_x86_64=('dc709cab51a05d6c3ebd832f7dd5f2cc95d93a2604836f4cb647dd6358b6e7d196f1d4aa8ce3adffbb216a39ff8c68b5553677d30f0d54107fe1e5c596cce2f8'
               'dbdb635a67cccf3164631d89bb532b47708b1ab318e08124bcf6147682acc3705d53e736c41b4c06998b13eb2efc66d7057ddf363bc305ed151e052db059ea4a')
b2sums_aarch64=('7ac4cf01babe93087788cb5243ea20dd0f1528e6ee86cddb68ea8aefcf4644c8698ddd7423e9d3fb21d5c5e2c83f05e8fe4a0f896d8939bb63499ad4868ac526'
                '5ae6ac8d9d828ec6249b2792d44511ac782514079216c7e8ec70c1e3a70c0c279b3e06aaaa516def01f839fc0e316eaec58c6b13e64b4e9f3311076f46fccb5d')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
