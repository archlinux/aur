# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-holy
pkgver=1.1.4
pkgrel=1
pkgdesc='ranger-like file browser written in Rust (holy branch)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(rust-nightly)
optdepends=('ranger: to open files using rifle'
            'xdg-utils: fallback to open files with xdg-open')
provides=(hunter)
conflicts=(hunter hunter-git hunter-holy-git)
source=($url/archive/v$pkgver-holy.tar.gz)
sha512sums=('4540d4df98cd49a8171d62a090fbd5c83264784c710c89718bc7ae6559d205e14921c42136acaee9e7bd95121cbd2f5400c056dd663e5fa277f71572fdadd47a')

build() {
  cd hunter-$pkgver-holy
  cargo +nightly build --release
}

package() {
  cd hunter-$pkgver-holy
  install -D {target/release/hunter,extra/scope.sh} -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/hunter
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
