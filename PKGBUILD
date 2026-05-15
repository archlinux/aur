# Maintainer: nathawat <nathawat at noreply dot codeberg dot org>

pkgname=hyprmt
pkgver=3.0.0
pkgrel=1
_tag=v${pkgver}
pkgdesc="Hyprland monitor toggle utility inspired by the Windows + P display picker"
arch=("x86_64")
url="https://codeberg.org/nathawat/hyprmt"
license=("GPL-3.0-or-later")
depends=("glibc" "hyprland>=0.55.0")
makedepends=("cargo")
optdepends=("fuzzel: overlay picker support")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/nathawat/hyprmt/archive/${_tag}.tar.gz")
b2sums=("81323ac6b075d5db99a6c972357077fa7b7ae627ba7e39458abc223365f607b957b1fb3ff3597ecc3565a5d4172bfc827cf80e843d0e002a26bef934e58099c1")

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
