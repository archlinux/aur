pkgname=mqttui
pkgver=0.13.0
pkgrel=1
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname}"
license=('GPL-3.0-or-later')
depends=()
makedepends=('cargo')
provides=("${pkgname}")

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('3ee9ef58287cf82fb73bafc590bc4a73523450a7202bdeafdf7cf2ce4558e761')

build() {
  cd $pkgname-$pkgver
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
  install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
