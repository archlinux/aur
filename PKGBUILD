# Maintainer: tee < teeaur at duck dot com >
pkgname=rayfish-bin
pkgver=0.5.6
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
b2sums_x86_64=('986e5f607ed2cb7d7247a65c9e4ebfc2e870242f40fe2de505d0452dab0d552919389270c58813d3dc7a02c176e1733dcbfaa21fafc2cf459ec0c439aa9df761'
               '7b2157ce7e87790622a15a4757a90161c324a80073c1cf927aaec6c4ce17cd51cacfc5f6b4c32b67e1e422a2a3dea912e97511653ee7cc302809706a71892504')
b2sums_aarch64=('bd7300a5c905ed4567913114059f8c7e0c6b5f9cc7f31e0927f24cf365b8436d0e4214bd1296068c932827a57f9e119c123bf9c904943e703d1e0876c67016fc'
                '069b05a9772bbf440ab5674f217e1b90eaff0dd189b0eda87a67cf61b8d7a8d6841a0677adf113894c35a3c924b05c78f51077a41c33d4d55465b8db7ca60f27')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
