# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributior: Francisco Giordano <fg@frang.io>

pkgname=volta
pkgver=2.0.0
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
sha256sums=('7cb34e39bca682eee35fa0ee908afdbfc833ce77b59c8b2ed9f6d7751d22df31')

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
