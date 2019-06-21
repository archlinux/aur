# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-holy-git
pkgver=1.2.3+23+g5c3640a
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (holy branch, git)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file xdg-utils gst-plugins-bad gst-plugins-ugly gst-libav)
makedepends=(git rust-nightly)
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
conflicts=(hunter hunter-holy)
source=(git+$url#branch=holy)
sha512sums=('SKIP')

pkgver() {
  cd hunter
  git describe --tags | sed 's#v##;s#-#+#g'
}

build() {
  cd hunter
  cargo +nightly build --release
}

package() {
  cd hunter
  install -D target/release/{hunter,preview-gen} -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/hunter
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
