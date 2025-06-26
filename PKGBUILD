# Maintainer: tarball <bootctl@gmail.com>

pkgname=wormhole-rs-bin
pkgver=0.7.6
pkgrel=1
pkgdesc='Rust implementation of Magic Wormhole, with new features and enhancements'
url='https://github.com/magic-wormhole/magic-wormhole.rs'
arch=(x86_64)
license=(EUPL-1.2)
depends=(glibc gcc-libs)
provides=(magic-wormhole wormhole-rs)
conflicts=(wormhole-rs)

source=("https://raw.githubusercontent.com/magic-wormhole/magic-wormhole.rs/$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/magic-wormhole-cli-x86_64-unknown-linux-gnu.tgz")

sha256sums=('6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665')
sha256sums_x86_64=('b0d86ac2d4032f07c390fa811a4a65d500e1c80cda41e207a22ae7ab719af919')

prepare() {
  local sh

  for sh in bash fish zsh; do
    ./wormhole-rs completion $sh >comp.$sh
  done
}

package() {
  local bin=wormhole-rs

  install -Dm755 $bin -t "$pkgdir/usr/bin/"
  install -Dm644 comp.bash "$pkgdir/usr/share/bash-completion/completions/$bin"
  install -Dm644 comp.fish "$pkgdir/usr/share/fish/vendor_completions.d/$bin.fish"
  install -Dm644 comp.zsh "$pkgdir/usr/share/zsh/site-functions/_$bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
