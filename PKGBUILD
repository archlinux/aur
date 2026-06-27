# Maintainer: novica <nnovica@gmail.com>

pkgname=arf
pkgver=0.4.2 # renovate: datasource=github-tags depName=eitsupi/arf
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

sha512sums=('c8c0e2d836d6966343412f86772821538b3548de2adec9abd4fe3d3a1d5ebc297e649a36b791a6608b1f65b7f48a0514b2318299bf84bf7ebe0ee0e6f9996cd8')
