# Maintainer: tee < teeaur at duck dot com >
# Co-maintainer: robertfoster
pkgname=rayfish-bin
pkgver=0.5.10
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
b2sums_x86_64=('6208d3b538fbe4c949981204fd2d53c3c1a5c7e037ac3856563a26ba1b61906268179818b44076cbb3abc01fce27bbcf6078d567bfc921d36a722817e9c22bbd'
               '6288854bad4e5e277a702049ac921c8714e450381d3ef15695d5bbc444128b71ee66036939de778911239f2867a6d9e816a11d3237f13d974ad8c97196753a5b')
b2sums_aarch64=('175fd715f129e40b0008f2ae3a69d7ae05a5ff6172e533cbe46491a4e3362fe952162804a18814b72746cdfda522bcfeb318b52d4fd43c622929d03d414050f1'
                '2b2436e502bb2b1f021ddd9ec05b1b45a01231752269ff3f19d7d86b39ca8ac531d115895c87eee592c0264c02d66ee2b5d754fa7804010e0393b3de09867944')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
