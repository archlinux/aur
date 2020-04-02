# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=guitar-git
pkgver=1.1.1.r36.g92a9600
pkgrel=1
pkgdesc="Open source Git GUI Client"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://soramimi.github.io/Guitar/"
license=(GPL)
depends=(qt5-svg git file)
makedepends=(cmake qt5-tools git)
provides=(guitar)
conflicts=(guitar)
source=("${pkgname%-git}::git+https://github.com/soramimi/Guitar.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir -p build
}

build() {
  cd "${pkgname%-git}/build"
  cmake ..
  make
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "build/Guitar" "$pkgdir/usr/bin/guitar"
  install -D "LinuxDesktop/Guitar.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/guitar.svg"
  install -D "LinuxDesktop/guitar.desktop" "$pkgdir/usr/share/applications/guitar.desktop"
}
