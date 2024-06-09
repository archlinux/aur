# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=bluray_info-git
pkgver=1.14.r0.g0f1a747
pkgrel=1
pkgdesc="Blu-ray utilities: bluray_info, bluray_copy, bluray_player"
arch=(x86_64)
url="https://github.com/beandog/bluray_info"
license=(GPL-2.0-only)
depends=(glibc libaacs libbluray mpv)
makedepends=(git)
provides=(bluray_info)
conflicts=(bluray_info)
source=("git+https://github.com/beandog/bluray_info.git")
sha256sums=('SKIP')

pkgver() {
  cd bluray_info
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd bluray_info
  autoreconf -f -i
}

build() {
  cd bluray_info
  ./configure --prefix=/usr --with-libmpv
  make
}

package() {
  cd bluray_info
  make DESTDIR="${pkgdir}" install
}
