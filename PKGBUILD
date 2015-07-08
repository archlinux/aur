# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: Daniele Marinello <m2346zc5-aur@yahoo.it>

pkgname=powermanga
pkgver=0.93.1
pkgrel=1
pkgdesc="Arcade 2D shoot-them-up game with 41 levels and more than 200 sprites"
arch=('i686' 'x86_64')
url="http://linux.tlk.fr/games/Powermanga/"
license=('GPL3')
depends=('sdl_mixer' 'libpng')
install=$pkgname.install
source=("http://linux.tlk.fr/games/Powermanga/download/$pkgname-$pkgver.tgz")
sha256sums=('da753fce83905a6db3fd8ea65c70c57d662362c86c429d6c6954417144f943e8')
backup=('var/games/powermanga/powermanga.hi'
        'var/games/powermanga/powermanga.hi-easy'
        'var/games/powermanga/powermanga.hi-hard')

build() {
  cd $pkgname-$pkgver

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
  mv "$pkgdir"/usr/games "$pkgdir"/usr/bin

  # fix permissions
  chgrp root "$pkgdir"/usr/bin/$pkgname
  chmod 0755 "$pkgdir"/usr/bin/$pkgname
  chmod 0775 "$pkgdir"/var/games
  chmod -R 0664 "$pkgdir"/var/games/powermanga

  # .desktop entry
  install -Dm644 images_for_menu_entry/powermanga_48x48.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
