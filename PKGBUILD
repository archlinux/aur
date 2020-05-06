# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-insta
pkgver=0.16.0
pkgrel=1
pkgdesc="Cargo plugin for snapshot testing in Rust"
url="https://github.com/mitsuhiko/insta"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('APACHE')
source=(https://github.com/mitsuhiko/insta/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('15f895a4bbfde635df4f30f5a517eda2ded1674af5259bd1d3661ac8fd293850a1ee3d908f0133dfcaa0a54be78c7d9c2d6d99109fb2030349a81f149b6c7ac7')

build() {
  cd "insta-${pkgver}"
  cargo build --release --package ${pkgname}
}

check() {
  cd "insta-${pkgver}"
  cargo test --release --package ${pkgname}
}

package() {
  cd "insta-${pkgver}"
  install -Dm755 \
    "target/release/${pkgname}" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
