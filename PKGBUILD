# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter
pkgver=1.2.3
pkgrel=1
pkgdesc='ranger-like file browser written in Rust'
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
conflicts=(hunter-holy)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('507cb50fa5d8243c95fa1f12c008541d5b0edd7a8353f47be7dce53e771e3a469405426d332d8e23181dfb4b5e3e2fbbe906bc2d48c8e2ca3f905f6325b4ae94')

build() {
  cd hunter-$pkgver
  cargo +nightly build --release
}

package() {
  cd hunter-$pkgver
  install -D target/release/{hunter,preview-gen} extra/scope.sh -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/hunter
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
