# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=just
pkgver=0.8.4
pkgrel=1
pkgdesc="A handy way to save and run project-specific commands"
arch=("i686" "x86_64")
url="https://github.com/casey/${pkgname}"
license=("custom:CC0")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/casey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("7aee472e4b70e62e89d7d5185493a3c680aeae4cc323c842e4c5b9b8af47040a")

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
