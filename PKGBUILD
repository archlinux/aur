# Maintainer: Vlad <ejiek@mail.ru>
pkgname=pacops
pkgver=0.0.1
pkgrel=1
pkgdesc='A package maintainers Swiss Army knife'
url='https://github.com/ejiek/pacops/'
arch=('x86_64')
license=('GPL3')
depends=('openssl' 'gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ejiek/pacops/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f0738b8de6a2aa7a5fcd987abb238e8f53cfcf2532f723d82698f29906b79380')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
 
  cargo build --release --all-features #--locked
  strip target/release/${pkgname}
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo test --release #--locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 \
    target/release/${pkgname} \
    -t "${pkgdir}/usr/bin/"

  install -Dm644 \
    LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

