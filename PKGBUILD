# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=suckit
pkgver=v0.1.0
pkgrel=1
pkgdesc="Recursively visit and download a website's content to your disk"
arch=('x86_64')
url="https://github.com/Skallwar/suckit"
license=('Apache')
depends=('openssl')
makedepends=('rust')
source=('git+https://github.com/skallwar/suckit.git')
sha256sums=('SKIP')

pkgver() {
        curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/skallwar/suckit/releases/latest | jq -r '.tag_name'
}

build() {
  cd "$pkgname"

  git checkout $pkgver

  cargo build --release --locked
}

check() {
  cd "$pkgname"
  # TODO: add `--release` flag after new release
  # https://github.com/Skallwar/suckit/commit/d9c17d9ec2459732ca0dee7b057002ecf7efd04a
  cargo test --locked
}

package() {
  cd "$pkgname"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
