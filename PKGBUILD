# Maintainer: tee < teeaur at duck dot com >
# Co-maintainer: robertfoster
pkgname=rayfish-bin
pkgver=0.5.13
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
b2sums_x86_64=('fc8228dd05d7a03b0096ecc55cffb4230129e257ffa2bb6816d567c43d7ec9b164afad5940fb51b9f112558f3bf12f245ae83371c431c39f1eaab4880a7c3a26'
               'f9f7d17c95fbefc662fec624a3fb98dca216e01a302c55fc54f27ea429cbe88768db89c2e3ba3c44124ba394dfd0b3231f36bf1a906bb8a391e7fe72fddc68c5')
b2sums_aarch64=('4a8ab65cedb70158b8ce210b969ea8cc75a7c4632cf425f99deb3be63dd4ab41e63493b6c0d855e89b8f6a128078928eed7535f769d41f888d106b2ba93bc968'
                '52eafa64519c099809b8f03f4b95868c73427f4dee902470c076f79bd07f30f722381f6843df36d220fa5af49df5439830fcf662358903f8ce30fff19b8b14ba')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
