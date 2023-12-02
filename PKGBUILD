# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=griels-quest
pkgver=1.00
pkgrel=3
pkgdesc="SDL port of a MSX1/MSX2 puzzle game (aka 'Griels Quest for the Sangraal')"
arch=('i686' 'x86_64')
url="https://github.com/nevat/griels-quest"
license=('GPL3')
depends=('sdl_mixer' 'sdl_image' 'sdl_ttf' 'sdl_gfx')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nevat/griels-quest/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6df0c25fd2edf03b663aefebabc965307095dd0a9c371c288c39f10458740afb')

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
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}
