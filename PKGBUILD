# Maintainer: novica <nnovica@gmail.com>

pkgname=arf
pkgver=0.2.1
pkgrel=2
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

sha512sums=('ec457a73a55b884f5740af71f768b8d4c992b9d48369bb195fe04cd5be76bf47ed7ceef426cd11ca3d9c8cd8895e419ac11a846c92edfb4d5ae804f00753ff6a')
