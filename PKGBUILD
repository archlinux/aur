# Maintainer: novica <nnovica@gmail.com>

pkgname=arf
pkgver=0.4.3 # renovate: datasource=github-tags depName=eitsupi/arf
pkgrel=1
pkgdesc="A modern R console"
url="https://github.com/eitsupi/arf"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
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

sha512sums=('6773dbf476ba932b8157f45ece129e0478412521f9961dc6ef8359f0e80c97cf443ffd0a0fcae10b6c6e29e7625a88c8d376b3b7610fb5a6127168767f6142f1')
