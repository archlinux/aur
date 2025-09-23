# maintainer: Collins Kimutai <ngenocollins599@gmail.com>
# Contributor: fossdd <fossdd@tutanota.com>
pkgname=boa-git
_pkgname=boa
pkgver=0.20.r228.g3bf25a6
pkgrel=1
pkgdesc="Boa is an embeddable and experimental Javascript engine written in Rust. Currently, it has support for some of the language."
arch=('i686' 'x86_64')
url="https://github.com/boa-dev/boa"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'git' 'cargo')
options=(!lto)
source=('git+https://github.com/boa-dev/boa.git')
sha256sums=('SKIP')
pkgver() {
  cd ${_pkgname}
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd ${_pkgname}

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
  cd ${_pkgname}
  cargo build --frozen --release --all-features --bin boa
}
package() {
  cd ${_pkgname}
  install -Dm755 target/release/${_pkgname} -t "${pkgdir}"/usr/bin/
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
}
