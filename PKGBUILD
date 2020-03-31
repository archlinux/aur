# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=spotify-tui-git
_pkgname=spotify-tui
pkgver=0.16.0+r2+gdf3b6c3
pkgrel=1
pkgdesc='Spotify client for the terminal written in Rust (git)'
arch=(x86_64)
url=https://github.com/Rigellute/spotify-tui
license=(MIT)
depends=(openssl libxcb)
makedepends=(git cargo python)
provides=(spotify-tui)
conflicts=(spotify-tui)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
  cd $_pkgname
  cargo build --locked --release
}

package() {
  cd $_pkgname
  install -D target/release/spt -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$_pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
}
