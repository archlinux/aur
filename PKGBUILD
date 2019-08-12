# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-holy
pkgver=1.3.0
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (holy branch)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(xdg-utils gst-plugins-base-libs)
makedepends=(rustup)
optdepends=('gst-plugins-good: media support'
            'gst-plugins-bad: media support'
            'gst-plugins-ugly: media support'
            'gst-libav: media support'
            'libsixel: media support'
            'nerd-fonts-complete: supported icon pack'
            'bat: syntax highlighting'
            'highlight: syntax highlighting'
            'libarchive: archive support'
            'p7zip: archive support'
            'w3m: HTML support'
            'links: HTML support'
            'elinks: HTML support'
            'lynx: HTML support'
            'poppler: PDF support'
            'mupdf-tools: PDF support')
provides=(hunter)
conflicts=(hunter)
source=(hunter-holy-$pkgver.tar.gz::$url/archive/v$pkgver-holy.tar.gz)
sha512sums=('81fac08545350eac39a5b7d2b3e258a7d01c75ec8158292200d1505cd459004fa6d30d546b3bc5b5f2ab48d96bb5c7597b2a2a4fc3ac2fade941a283d2af396e')

build() {
  cd hunter-$pkgver-holy
  rustup override set nightly
  cargo build --release
}

package() {
  cd hunter-$pkgver-holy
  install -D target/release/hunter{,-media} -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/hunter
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
