# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-holy
pkgver=1.2.1
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (holy branch)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file xdg-utils gst-plugins-bad gst-plugins-ugly gst-libav)
makedepends=(rust-nightly)
optdepends=('nerd-fonts-complete: supported icon pack')
provides=(hunter)
conflicts=(hunter hunter-git hunter-holy-git)
source=($url/archive/v$pkgver-holy.tar.gz)
sha512sums=('f13443e9b5e730d1f1ada33cde5e14f20446f87453dd53a46eb281cb9e5a2b507bdc0291f2ee1417b0213adfa540292cabf6ceedc79a66f935bfb5c96fb7a460')

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
