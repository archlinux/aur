# Maintainer: gbr <gbr@protonmail.com>
pkgname=sfz
pkgver=0.4.0
pkgrel=2
pkgdesc='A simple static file server'
arch=('x86_64')
url='https://github.com/weihanglo/sfz'
license=('MIT' 'APACHE')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'remove-unnecessary-hidden-file-test.patch')
sha512sums=('f6f95470ee2d839c0086aa6f5397a5b6937692907e688800f2af610b7fb8e69ea23cef4daa8696fce93fd388774a6206b8b8a9f355e19cb8bf7112b11828bfd7'
            '4426f58075e8ccad96c14266e08547f30c8040f45702c40fca184cb7a2f8cab1fd22b82a1153c485e25812e67c253a1e36ec0a39d6bc8b0d4beb4548a2a6ccd9')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir/remove-unnecessary-hidden-file-test.patch"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 'LICENSE-APACHE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 'LICENSE-MIT' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

