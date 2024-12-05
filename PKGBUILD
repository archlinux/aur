# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributior: Francisco Giordano <fg@frang.io>

pkgname=volta
pkgver=2.0.2
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
sha256sums=('0e93d17c36fb79222b10881d6c67d667483f85b19a0498eacfc535ef31894dbe')

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
