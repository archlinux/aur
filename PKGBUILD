pkgname=hermes-cli
pkgver=0.1.3
pkgrel=1
pkgdesc="Native speech-to-text CLI daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/adityamiskin/hermes"
license=('custom')
options=('!lto')
depends=('glibc' 'gcc-libs' 'wl-clipboard')
makedepends=('cargo' 'git')
source=("git+https://github.com/adityamiskin/hermes.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/hermes"
  cargo build --release --locked --bin hermes
}

package() {
  cd "${srcdir}/hermes"
  install -Dm755 target/release/hermes "${pkgdir}/usr/bin/hermes"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
