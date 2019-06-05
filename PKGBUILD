# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter
pkgver=1.2.1
pkgrel=1
pkgdesc='ranger-like file browser written in Rust'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file xdg-utils gst-plugins-bad gst-plugins-ugly gst-libav)
makedepends=(rust-nightly)
optdepends=('nerd-fonts-complete: supported icon pack')
conflicts=(hunter-git hunter-holy hunter-holy-git)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('58646eb0e353d235eede2efa034dde9b5b6892eee82d64f938233faf250e019ae6a5b02162b77a9b979bf6f3adc8b71333bda0f1711d830845d01a14b21c7833')

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
