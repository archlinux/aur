pkgname=hermes-cli
pkgver=0.1.2
pkgrel=1
_commit=418773c128790db07c5a900bfb6283918ed87e3f
pkgdesc="Native speech-to-text CLI daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/adityamiskin/hermes"
license=('custom')
options=('!lto')
depends=('glibc' 'gcc-libs' 'wl-clipboard')
makedepends=('cargo' 'git')
source=("git+https://github.com/adityamiskin/hermes.git#commit=${_commit}")
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
