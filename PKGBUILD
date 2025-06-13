# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=wl-plant
pkgver=1.0
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
sha256sums=('b4e7bf51605e4f16803a2334206d9f1a4225ff310e6646540fcbeb26e6f34b17'
            'SKIP')

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



