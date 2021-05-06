# Maintainer: Masaki Waga <masakiwaga@gmail.com>
pkgname=teip
pkgver=1.2.1
pkgrel=1
makedepends=('rust' 'cargo')
depends=('gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Highly efficient \"Masking tape\" for standard input"
url="https://github.com/greymd/teip"
license=('MIT')
source=("https://github.com/greymd/teip/archive/v${pkgver}.tar.gz")
sha256sums=('5c09e4a3507c2298df59c3070a11cf0ec1ec71162ff492d915ee6d646771eb0c')

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
