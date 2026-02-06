# Maintainer: novica <nnovica@gmail.com>

pkgname=arf
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern R console"
url="https://github.com/eitsupi/arf"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    gcc-libs
    glibc
)
conflicts=('arf-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("arf-${pkgver}.tar.gz::https://github.com/eitsupi/arf/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/arf-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/arf-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/arf-${pkgver}/target/release/arf"  "${pkgdir}/usr/bin/arf"
  install -Dm644 "${srcdir}/arf-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('e419772231a157d3de7a88b99b9712ddff01d9f47d8ca8c076a5afe7e1e567c68ae7564027f9b5084504fbb25b699edc85c4f27a28b64834a5e32498fa57e70a')
