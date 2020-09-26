# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=just
pkgver=0.7.3
pkgrel=1
pkgdesc="A handy way to save and run project-specific commands"
arch=("i686" "x86_64")
url="https://github.com/casey/${pkgname}"
license=("custom:CC0")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/casey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("f910f73d2d53d437b99bc6541928aa7ac2332e4a17ed9f6016be42105b2f12c1")

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
