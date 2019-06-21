# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-holy
pkgver=1.2.3
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (holy branch)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file xdg-utils gst-plugins-bad gst-plugins-ugly gst-libav)
makedepends=(rust-nightly)
optdepends=('nerd-fonts-complete: supported icon pack'
            'bat: syntax highlighting'
            'highlight: syntax highlighting'
            'p7zip: archive support'
            'w3m: HTML support'
            'links: HTML support'
            'elinks: HTML support'
            'lynx: HTML support'
            'poppler: PDF support'
            'mupdf-tools: PDF support')
provides=(hunter)
conflicts=(hunter)
source=($url/archive/v$pkgver-holy.tar.gz)
sha512sums=('805561a541e6aa95eff1a64d7e686564d5727fe5179f813dd618a3382d1605057d73a3bd1d58311fd755b78c25295a7215f8aa01447c10074cfc70599c6c84d5')

build() {
  cd hunter-$pkgver-holy
  cargo +nightly build --release
}

package() {
  cd hunter-$pkgver-holy
  install -D target/release/{hunter,preview-gen} extra/scope.sh -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/hunter
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
