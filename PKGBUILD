# Maintainer: Masaki Waga <masakiwaga@gmail.com>
pkgname=teip
pkgver=1.2.0
pkgrel=1
makedepends=('rust' 'cargo')
depends=('gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Highly efficient \"Masking tape\" for standard input"
url="https://github.com/greymd/teip"
license=('MIT')
source=("https://github.com/greymd/teip/archive/v${pkgver}.tar.gz")
sha256sums=('b626ec84ce6bdea965ac1bf13f43443ef51eaef4adc724ca99dd9aa3b8829244')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/licenses/teip/"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/teip/LICENSE"
}
