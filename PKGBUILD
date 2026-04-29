# Maintainer: IRendy <irendy@qq.com>

pkgname="komitoto"
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI assistant for HAM"
url="https://github.com/IRendy/komitoto"
arch=("x86_64" "aarch64")
license=("MIT")

makedepends=(
  'cargo'
  'git'
)
depends=()
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  CC="cc"
  LDFLAGS="-lsqlite3"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"

  cargo install --root "$pkgdir" --path . --locked

  install -Dm644 -t "$pkgdir/usr/share/$pkgname/" "hamradio-zones-geojson-main/"*

  # 4. 安装许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
