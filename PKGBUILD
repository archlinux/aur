# Maintainer: Om <your.email@example.com>
pkgname=vivid-engine
pkgver=0.4.0.3.g233f8f8
pkgrel=1
pkgdesc="Lightweight, daemon-driven Wayland wallpaper engine with smooth animations & video support"
arch=('x86_64')
url="https://github.com/omaku2006/vivid-engine"
license=('MIT')
depends=('ffmpeg' 'libva' 'wayland')
makedepends=('cargo' 'git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "${pkgname}"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked
}

package() {
  cd "${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
