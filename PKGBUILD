# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=popsicle
pkgver=1.3.3
pkgrel=2
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
url="https://github.com/pop-os/popsicle"
arch=(x86_64 i686 aarch64 armv7h)
license=(MIT)
depends=(gtk3)
makedepends=(git cargo clang help2man)
source=("git+https://github.com/pop-os/popsicle.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "popsicle"
  export RUSTUP_TOOLCHAIN=stable
  make vendor
  make VENDORED=1
}

package() {
  cd "popsicle"
  make DESTDIR="${pkgdir}/" prefix=/usr install
  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

