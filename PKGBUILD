# Maintainer: nathawat <nathawat at noreply dot codeberg dot org>

pkgname=hyprmt
pkgver=3.0.0
pkgrel=1
pkgdesc="Hyprland monitor toggle utility inspired by the Windows + P display picker"
arch=("x86_64")
url="https://codeberg.org/nathawat/hyprmt"
license=("GPL-3.0-or-later")
depends=("glibc" "hyprland>=0.55.0")
makedepends=("cargo" "git")
optdepends=("fuzzel: overlay picker support")
source=("git+${url}.git#tag=v${pkgver}")
b2sums=("62508250a872b4f4d29d17460c1540fbc8f7dc82d55cce1da0ac807d41270db80488ef0684b4b8cee772c32667b12828b4ed3016a3fde426cb6216590b474c15")

prepare() {
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${pkgname}"
  cargo test --frozen
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
