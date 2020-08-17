# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributer: Pico <founderofjp@gmail.com>
# Contributer: Jesus Franco <jesusfranco at gmail dot com>

pkgname=ciano-git
pkgver=0.2.4.r0.ge7dd4bd
pkgrel=1
pkgdesc="A simple multimedia file converter for elementary OS"
arch=(i686 x86_64)
url="https://robertsanseries.github.io/ciano/"
license=(GPL3)
depends=(libgranite.so gtk3 ffmpeg imagemagick)
optdepends=(elementary-icon-theme)
makedepends=(git vala meson ninja)
conflicts=(ciano)
provides=(ciano)
source=("git+https://github.com/robertsanseries/ciano.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  meson . build --prefix=/usr
  ninja -C build
}

package() {
  cd "${pkgname%-git}"
  DESTDIR="${pkgdir}/" ninja -C build install
  ln -s com.github.robertsanseries.ciano "$pkgdir/usr/bin/ciano"
}

