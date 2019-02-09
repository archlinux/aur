# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-fuzz
pkgver=0.5.3
pkgrel=1
pkgdesc="Command line helpers for fuzzing "
url="https://github.com/rust-fuzz/cargo-fuzz"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rust-fuzz/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b2e116fa6dbb4d62402508687faf92472e7a2979740f31ab4f698c105cac8114')
sha512sums=('08f1fa7adb958033f779fda8e6d7d66c9925396aa20550c4adb6f911c5eb062c8477648bc38ac6e4d482ed36f5f29f0a14b3ecfb9877eeb6d824b5ef4e1f2d04')

build() {
  cd "${pkgname}-${pkgver}"
  # outdated Cargo.lock: https://github.com/rust-fuzz/cargo-fuzz/issues/168
  cargo build --release
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
