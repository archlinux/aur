# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-git
pkgver=1.3.4+r28+gd42f7d3
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (git)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(xdg-utils gst-plugins-base-libs libsixel)
makedepends=(git rustup gst-plugins-bad)
optdepends=('gst-plugins-good: media support'
            'gst-plugins-ugly: media support'
            'gst-libav: media support'
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
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd hunter
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
  cd hunter
  rustup override set nightly
  cargo build --release
}

package() {
  cd hunter
  install -D target/release/hunter{,-media} -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/hunter
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
