# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=just
pkgver=0.6.1
pkgrel=1
pkgdesc="A handy way to save and run project-specific commands"
arch=("i686" "x86_64")
url="https://github.com/casey/${pkgname}"
license=("custom:CC0")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/casey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("3707b202a16bc4541cccb26316bc13b3b3853055c47a7a50e7a0e64dca33062a")

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
