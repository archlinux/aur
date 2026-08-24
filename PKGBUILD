# Maintainer: Collins Kimutai <ngenocollins599@gmail.com>
pkgname=himalaya-git
_pkgname=himalaya
pkgver=2.1.0
pkgrel=1
pkgdesc="CLI to manage emails, written in Rust"
arch=('x86_64')
url="https://github.com/pimalaya/himalaya"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!lto)
md5sums=('2c850397fc648945c9f38afe37d90f0f')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm 644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
