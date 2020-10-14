# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=just
pkgver=0.8.0
pkgrel=1
pkgdesc="A handy way to save and run project-specific commands"
arch=("i686" "x86_64")
url="https://github.com/casey/${pkgname}"
license=("custom:CC0")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/casey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("624cf1681cf7df8e50b70f37b29e4194cf4ad7327a335fcdf94dd83b19e45a2b")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/completions/just.zsh" "${pkgdir}/usr/share/zsh/site-functions/_just"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/completions/just.bash" "${pkgdir}/usr/share/bash-completion/completions/just"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/completions/just.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/just.fish"
}
