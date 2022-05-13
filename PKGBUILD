# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=yabar-git
_pkgname=yabar
pkgver=0.4.0.r179.ga0d3fdf
pkgrel=1
pkgdesc="A modern and lightweight status bar for X window managers"
arch=('i686' 'x86_64')
url="https://github.com/geommer/yabar"
license=('MIT')
depends=('alsa-lib' 'pango' 'libconfig' 'xcb-util-wm' 'gdk-pixbuf2' 'wireless_tools' 'libxkbcommon-x11')
optdepends=('playerctl: playerctl integration')
makedepends=('git' 'asciidoc')
provides=('yabar')
conflicts=('yabar')
source=(git+https://github.com/geommer/yabar.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  if pkg-config --exists playerctl-1.0; then
    make PLAYERCTL=1
  else
    make
  fi
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install
}
