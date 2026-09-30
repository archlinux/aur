# Maintainer: tee < teeaur at duck dot com >
pkgname=rayfish-bin
pkgver=0.5.5
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
b2sums_x86_64=('f71467ec05004efb4ff18770488215836bfb4ca8b96595b1539a852df330685e86683c2ab20d9327c5d8ebec9b132e98609fb89315f6588261adb311dd1fe2d5'
               '9a6c69d777d5537deed32335dacf74bb68b559c88ca8c07a45671b9cedbc6ba759f072e70aba7a8cbdf3e7b3ad16545f797d454fd5e52e93ae597daa4d1fefab')
b2sums_aarch64=('05293608e7198ea72cf3a5314f7cd315a59c34745d3222de9b0e7727060b6c5c660dfdbf86e2147556fcd0fdaff0c43ff9a44fe1a9182730e86cbd847e0c33c4'
                'dad2e49d9812fa4aeb352f9b7629c91c0f49f90f5712980e6a24c53a5f23d2f6a6bc59f04ec20aba2a72f09748eecdfdd60164aa8c7a454fa4c82fb13057822f')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
