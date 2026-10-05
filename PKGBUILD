# Maintainer: tee < teeaur at duck dot com >
pkgname=rayfish-bin
pkgver=0.5.8
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
b2sums_x86_64=('6f5508ac561c9e145e7531efc8438c9cf854219000de6946ce65bc44ec5c76dc975ba9ae2e75ce5a6721d24fd62abc81e5e628d919c15204a9ab65a714c72732'
               'd827c4b0cc6a34c87a9d77710c93faf13996430629953ce6cba11802a2128dbead17fa2cf05602944521a6fb9a737f1b3c4a3d143f51f07f8de4a52ad4f3fa37')
b2sums_aarch64=('6cd69f088c6eea425689ef4e1ed866b61f0d2fb75b961cef9a35d3721e54cfd00c9908ccfb5974ce34342e1596efc42d252a4029a5c4fc2ce12b537c2370689f'
                '59ca97e7dd70cb4abc92b0e7678ac431a0dffea9dce9af61a33badc5c81e126a44b70b05f2015c411e171cebd7f95184f7f8682be912508536445d386e06b86e')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
