# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=usvg
_pkgname=resvg
pkgver=0.13.1
pkgrel=1
pkgdesc="usvg (micro SVG) is an SVG simplification tool"
url="https://github.com/RazrFalcon/resvg"
arch=(x86_64)
license=(MPL2)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/RazrFalcon/resvg/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

check() {
  cd "${_pkgname}-${pkgver}/usvg"
  cargo test --release --locked --target-dir=target
}

build() {
  return 0
  #cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${_pkgname}-${pkgver}/usvg"
  cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
  #install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
