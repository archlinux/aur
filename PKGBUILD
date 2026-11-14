# Maintainer: novica <nnovica@gmail.com>

pkgname=arf
pkgver=0.7.1 # renovate: datasource=github-releases depName=eitsupi/arf
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

sha512sums=('ec5a8ede7ffd8c09f20abe4d469c804d2b2b5dcdb9de9bf4137bce8f8bd1a2b588b7ebd3410df26c36cee7d6360a7af068a97b0857b897502d7d75f8ecb8dda7')
