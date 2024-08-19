# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributior: Francisco Giordano <fg@frang.io>

pkgname=volta
pkgver=2.0.1
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
sha256sums=('4ccffc86b7841cb8bc9a55436529209dbbb9621992e43cbad48ccc7ffadba493')

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
