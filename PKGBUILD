pkgname=resto-rs
pkgver=0.5.0
pkgrel=1
pkgdesc="tui http client written in Rust"
arch=('x86_64')
github_repo_name=resto
url="https://github.com/tednaaa/$github_repo_name"
license=("GPL3")
depends=()
makedepends=('cargo')
source=("$github_repo_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$github_repo_name-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$github_repo_name-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$github_repo_name-$pkgver"
  cargo test --frozen
}

package() {
  cd "$github_repo_name-$pkgver"
  install -Dm 755 "target/release/$github_repo_name" -t "$pkgdir/usr/bin"
}
