# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=wl-plant
pkgver=1.1
pkgrel=2
url="https://github.com/gitRaiku/plant"
pkgdesc="A suckless wayland daemonless notification utility"
arch=(any)
license=('GPL-3.0')
depends=('wayland' 'wlroots0.18')
makedepends=('make' 'wayland-protocols')
install="${pkgname}.install"
source=("https://github.com/gitRaiku/plant/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/gitRaiku/plant/releases/download/v$pkgver/config.h")
sha256sums=('d2e4189978de51c6f007ffc87776483525f4174faaef4dab73e37471364b66d5'
            '3651b84af8dcf556e955639cb393c42144a07cd35e9e21b4b78b332fbd8e88b7')

prepare() {
  cp config.h plant-$pkgver/src/config.h
}

build() {
  cd $srcdir/plant-$pkgver
  make $MAKEOPTS
}

package() {
  cd "plant-$pkgver"
  install -Dm 0755 bin/plant -t "$pkgdir/usr/bin/"
}

post_install() {
  echo $(cat configure.install)
}



