# Maintainer: Caleb Maclennnan <caleb@alerque.com>

# TODO:
# * upstream 0.0.0 released to crates.io but not tagged,
#   drop $_sha and switch source to *.tar.gz when repo gets tagged

pkgname=sear
pkgver=0.0.0
_sha=ba1f37f5dd1a32c5de2a20e8c385678d95d403a8
pkgrel=1
pkgdesc="Signed/Encrypted ARchive"
arch=('x86_64')
url="https://github.com/iqlusioninc/$pkgname"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.zip::$url/archive/$_sha.zip")
sha256sums=('391e5fd18fa7ca14eb866b448f8e5efe355c276cf4b78814c97bdaffb25f8811')

build() {
  cd "$pkgname-$_sha"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$_sha"
  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
