# Maintainer: Greyson Christoforo <first name at last name dot net>
pkgname=rudolfs
pkgver=0.3.3
pkgrel=1
pkgdesc="A high-performance, caching Git LFS server"
arch=(x86_64)
url="https://github.com/jasonwhite/rudolfs"
license=(MIT)
makedepends=(
cargo
)
depends=(
gcc-libs
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jasonwhite/rudolfs/archive/${pkgver}.tar.gz")
sha256sums=('f4d77bd218059215b3721343bfe67a25e6e070a548fa764abcb19a34dd571756')

prepare() {
  cd rudolfs-${pkgver}
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd rudolfs-${pkgver}
  cargo build --release --frozen --all-targets
}

check() {
  cd rudolfs-${pkgver}
  cargo test --release --frozen
}

package(){
  cd rudolfs-${pkgver}
  install -Dt "${pkgdir}/usr/bin" target/release/rudolfs
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

