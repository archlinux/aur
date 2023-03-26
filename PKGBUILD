# Maintainer: Will Elliott <troutcobbler@gmail.com>

pkgname=eww
pkgver=0.4.0
pkgrel=2
pkgdesc="A standalone widget system made in Rust."
url='https://github.com/elkowar/eww'
arch=(x86_64)
license=(MIT)
makedepends=(rustup git)
depends=(gtk3)
conflicts=(eww-git eww-wayland)
source=("git+${url}#tag=v${pkgver}")
b2sums=('SKIP')

prepare() {
  cd "$pkgname"
  git apply "${startdir}/remove_box_syntax.patch"
}

build() {
  cd "$pkgname"
  rustup toolchain install nightly
  cargo +nightly build --no-default-features --features x11 --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/eww "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
