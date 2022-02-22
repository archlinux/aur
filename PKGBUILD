# Maintainer: 
# Contributor: FabioLolix
# Contributor: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui-git
pkgver=0.25.0.r15.gc4dcf6b
pkgrel=1
pkgdesc="Spotify client for the terminal written in Rust"
arch=(x86_64)
url="https://github.com/Rigellute/spotify-tui"
license=(MIT)
depends=(gcc-libs openssl)
makedepends=(git cargo)
provides=(spotify-tui)
conflicts=(spotify-tui)
source=("git+https://github.com/Rigellute/spotify-tui.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cargo build --locked --release
}

package() {
  cd "${pkgname%-git}"
  install -D target/release/spt -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
