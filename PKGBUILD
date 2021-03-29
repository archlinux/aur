# Maintainer: Greyson Christoforo <first name at last name dot net>
pkgname=rudolfs
pkgver=0.3.1
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
sha256sums=('cfad6abd36c9d04f4259f22a24674f6a4855f18c1be05128bad2fc42b18ead85')

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

