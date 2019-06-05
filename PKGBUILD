# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-git
pkgver=1.2.1+14+gcaf2429
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (git)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file xdg-utils gst-plugins-bad gst-plugins-ugly gst-libav)
makedepends=(git rust-nightly)
optdepends=('nerd-fonts-complete: supported icon pack')
provides=(hunter)
conflicts=(hunter hunter-holy hunter-holy-git)
source=(git+$url)
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
