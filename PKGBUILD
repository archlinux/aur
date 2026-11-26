# Maintainer: tee < teeaur at duck dot com >
# Co-maintainer: robertfoster
pkgname=rayfish-bin
pkgver=0.5.19 # renovate: datasource=github-releases depName=rayfish/rayfish
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
b2sums_x86_64=('0c99d99eb38677c6dd219d3d74606c556be59a112d1e5f703f60f7a5355c321772419a4a5fe13a5df20a970fa28ab5572714e00d3d4edee808f53bdc08195b49'
               '8a5a8a35493708a2da8ddd9b95d76704faa0b6c6123f087828806e045e8e3f93c6bcfeae5023a5294d9e06faeab097af61c86ff3db54fbaba0f95a2a5ffd3688')
b2sums_aarch64=('b93e3acb31ce6bcf1cb388c0a8a8347f6e2f35c2f30124295f0d51c71c8aadf69a385ccd5ece6513635a44ae3f4c1d48a224d1fc53a5f1e65dd3ec289d18b77d'
                'fa53f2dea8be0456e6512b4878f29451e0373d6e3b9e76c8bde7bf0be6aa10a598d58f007bac6f1d9665ded3f7e9012ffaf0e8b3aedbc133aba319488a5e1e3a')

package() {
  install -Dm755 "rayfish-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
  sed -i "s|/local||" rayfish.service
  install -Dm644 rayfish.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/ray.fish"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions zsh  2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_ray"
  install -Dm644 <("$pkgdir/usr/bin/ray" completions elvish 2>/dev/null) "$pkgdir/usr/share/elvish/lib/ray.elv"
}
