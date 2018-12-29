# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=mcfly
pkgver=0.3.1
pkgrel=1
pkgdesc="Fly through your shell history"
arch=('i686' 'x86_64')
url="https://github.com/cantino/mcfly"
license=('MIT')
depends=('sh')
makedepends=('rust' 'cargo')
install=mcfly.install
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cantino/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c7ba5868923c1f2e4589fec5c9f88a337d5248d48220f6d412f5655bb93b15ae')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/mcfly" "${pkgdir}/usr/bin/mcfly"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/mcfly.bash" "${pkgdir}/usr/share/doc/mcfly/mcfly.bash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
