# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributior: Francisco Giordano <fg@frang.io>

pkgname=volta
pkgver=1.1.1
pkgrel=1
pkgdesc="The Hassle-Free JavaScript Tool Manager"
arch=('x86_64')
url="https://volta.sh/"
license=('BSD-2-Clause')
provides=('volta')
conflicts=('volta-bin')
depends=(
  'gcc-libs'
  'glibc'
  )
makedepends=(
  'cargo'
)
options=('!lto')
source=("${pkgname}-${pkgver}::https://github.com/${pkgname}-cli/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f2289274538124984bebb09b0968c2821368d8a80d60b9615e4f999f6751366d')

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        echo "Building Volta"
        cargo build --release
}

package() {
        echo "Packaging Binaries"
        cd "${srcdir}/${pkgname}-${pkgver}/target/release"
        install -Dm755 -t "${pkgdir}/usr/bin" volta volta-shim volta-migrate
        cd "${srcdir}/${pkgname}-${pkgver}"
        install -Dm755 -t "${pkgdir}/usr/share/licenses/$pkgname" LICENSE
}
