pkgname=sandlock
pkgver=0.7.0
pkgrel=0
pkgdesc="A process-based sandbox for Linux, no container, no VM, no root. "
arch=('x86_64')
url="https://github.com/multikernel/sandlock"
license=(Apache)
options=('!lto')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/multikernel/sandlock/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6cd37e503b0202ec98025bbd5e42f635240eb11c1b76a655abe0d306bdf2c8aee39a42646b6e26e93ead093abd2cd20e279902db1bba9363eda8fe6402be6076')
b2sums=('663d79ab13400d48ab5d66bff867032cfa6affc8b8a27e2679018e5310beb97126be33cd6a2ac092fc684fb5cb73c404b5c788d90a129d86f285c45a06527678')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  return 0
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/sandlock "${pkgdir}/usr/bin/sandlock"
  install -Dm755 target/release/libsandlock_ffi.so "${pkgdir}/usr/lib/libsandlock_ffi.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
