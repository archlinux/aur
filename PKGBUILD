# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor:  Philip Goto <philip.goto@gmail.com>

pkgname=popsicle-git
pkgver=0.1.5.r180.g7c82a07
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
url="https://github.com/pop-os/popsicle"
arch=(x86_64 i686 aarch64 armv7h)
license=(MIT)
depends=(gtk3)
makedepends=(git rust cargo help2man xorgproto)
provides=(popsicle)
conflicts=(popsicle)
source=("git+https://github.com/pop-os/popsicle.git#branch=async")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make
}

package() { 
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}/" prefix=/usr install
  install LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

