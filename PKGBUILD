# Maintainer: tee < teeaur at duck dot com >
# Co-maintainer: robertfoster
pkgname=rayfish-bin
pkgver=0.5.12
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
b2sums_x86_64=('bd6de5edcd98f15e67129023f25ef393f2260c08979426c6a673740b4687b6320897a163d980a917999ed25473a62a665d6803117070caf6dd3ea72cdadba8c1'
               '51fcc3f2d5cc159cf6a50b6a3ef9a410c9466a9b61ba8f627862ad31800a4822614c8f864249f593e97f26c98ec3c8218bb7ca5d5294ba4f0d414277a75fb265')
b2sums_aarch64=('05a08b91f3e53f2ac3606675d428f329e7b9eb8ca9d68c33354abb496a37cf9e91cfa925d3a8994e6152481df2f3f06644cc72ed02dba0e08c93939ca687d902'
                '6ad18a7d97df6a5934b572ffa76d2868ff06a5f424ffe9a49ac4440359f5fbc1436e71aa08a4dee8a06eb2f7c19eb26f49c44cf36d8a6cab080e4a89949d4ff0')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
