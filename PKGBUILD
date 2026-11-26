# Maintainer: tee < teeaur at duck dot com >
# Co-maintainer: robertfoster
pkgname=rayfish-bin
pkgver=0.5.18 # renovate: datasource=github-releases depName=rayfish/rayfish
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
b2sums=('ea64e603735076c542af3d9c61520709df834f4255ee2da6bf05a66285a2b1bfdcd2f3a2c0ed98053f0f77f21b8df9fee116fc686778fc3f68e76d7e73f70737')
b2sums_x86_64=('7b6de3d97a93fd4c8a7212f494d640ed32e4650912315dc163e7473941dfce8add19c3308b62becca2b5e7dc114b8cf8db88c83e8189f429fee87d603ba7c003'
               '40f7d75a3e1a206a52134d6dc144da1afac878b913547f0407ac7749c45b44d46d0cc7e742615b8f41da29265004f5ff443ec954fd74956f614faf974b3028e2')
b2sums_aarch64=('72bb98c0f8274f0d0a0ffb854261215c43f44c5e97f261ab89a524e03396a93c9808e5ae7d2f4fe3b69eaaea00af75ace4c33480cb5c1328d64741ae03742f94'
                '2e4035508b1d213cdb23c35f14bcd858f9c34bec200031868daf07909ddb8c762422cbb71e9b37c2a22280d1fd3d4bd55219d6e901c70e1c27a695d3e9f7c9a7')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
