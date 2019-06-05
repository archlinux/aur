# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-holy-git
pkgver=1.2.1+16+g8f6f7fb
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (holy branch, git)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file xdg-utils gst-plugins-bad gst-plugins-ugly gst-libav)
makedepends=(git rust-nightly)
optdepends=('nerd-fonts-complete: supported icon pack')
provides=(hunter)
conflicts=(hunter hunter-git hunter-holy)
source=(git+$url#branch=holy)
sha512sums=(SKIP)

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
  install -D target/release/{hunter,preview-gen} extra/scope.sh -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/hunter
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
