# Maintainer: Danilo Bargen <aur ät dbrgn döt ch>

pkgname=minidump-stackwalk
pkgver=0.19.1
pkgrel=1
pkgdesc="A CLI minidump analyzer"
arch=('i686' 'x86_64')
url="https://crates.io/crates/minidump-stackwalk"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('2d1a89d5a95b0504beb37f9b4e1953bd5acbeed554655b8c2552c4c58449c92c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  install -D target/release/minidump-stackwalk -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
