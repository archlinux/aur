# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=popsicle
pkgver=1.3.0+47+gb02ebf5
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
url="https://github.com/pop-os/popsicle"
arch=(x86_64 i686 aarch64 armv7h)
license=(MIT)
depends=(gtk3)
makedepends=(git cargo help2man xorgproto)
source=("git+https://github.com/pop-os/popsicle.git#commit=b02ebf5f2e6c18777453ca9a144d69689a6fa901")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/-/+/g'
}

build() {
  cd "${pkgname}"
  make
}

package() { 
  cd "${pkgname}"
  make DESTDIR="${pkgdir}/" prefix=/usr install
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

