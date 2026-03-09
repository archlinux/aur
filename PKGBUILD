# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=griels-quest
pkgver=1.0.1
pkgrel=1
pkgdesc="SDL2 port of a MSX1/MSX2 puzzle game (aka 'Griels Quest for the Sangraal')"
arch=('x86_64')
url="https://github.com/nevat/griels-quest"
license=('GPL-3.0-only')
depends=('sdl2_mixer' 'sdl2_image')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nevat/griels-quest/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9132bbd35bfd78d15f23f91cdd2752bb1b4eb917549e41f32ff120f8063c234')

prepare() {
  # fix name in .desktop file
  sed -e "s/Exec=.*/Exec=$pkgname/;s/Icon=.*/Icon=$pkgname/" -i $pkgname-$pkgver/griels.desktop
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver

  # binary
  install -Dm755 griels "$pkgdir"/usr/bin/$pkgname
  # data
  install -d "$pkgdir"/usr/share/griels/{music,fx,data,png}
  install -m644 music/* "$pkgdir"/usr/share/griels/music
  install -m644 fx/* "$pkgdir"/usr/share/griels/fx
  install -m644 data/* "$pkgdir"/usr/share/griels/data
  install -m644 png/* "$pkgdir"/usr/share/griels/png
  # .desktop + icon
  install -Dm644 griels.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 png/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  # doc
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
