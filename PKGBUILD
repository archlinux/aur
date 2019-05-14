# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter
pkgver=1.1.4
pkgrel=1
pkgdesc='ranger-like file browser written in Rust'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust-nightly)
optdepends=('ranger: to open files using rifle'
            'xdg-open: fallback to open files with xdg-open')
conflicts=(hunter-git hunter-holy hunter-holy-git)
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('f867ca8b10af89e182f4fee672e76285fcf0547f90cb37b76ca16d7ce874b914d550f0b3ece4a38fc5d6da32807c4b26a7ec92af4a0f772c66a084358fd0607c')

build() {
  cd hunter-$pkgver
  cargo +nightly build --release
}

package() {
  cd hunter-$pkgver
  install -D {target/release/hunter,extra/scope.sh} -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/hunter
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
