# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-insta
pkgver=1.11.0
pkgrel=1
pkgdesc="Cargo plugin for snapshot testing in Rust"
url="https://github.com/mitsuhiko/insta"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('APACHE')
source=(https://github.com/mitsuhiko/insta/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1647019424f572331792a27f91be9bed62585f09eb43e2e2d2b49c65382e6dcf012ef1c731628ea9b8e2926b0f1de2d62e9780d18fd9fba870aeb75f4b84976c')

build() {
  cd "insta-${pkgver}/cargo-insta"
  cargo build --release --package ${pkgname}
}

check() {
  cd "insta-${pkgver}/cargo-insta"
  cargo test --release --package ${pkgname}
}

package() {
  cd "insta-${pkgver}/cargo-insta"
  install -Dm755 \
    "target/release/${pkgname}" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
