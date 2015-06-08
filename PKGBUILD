# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

# flashback_data_files.7z if from http://gtamp.com/PSP/reminiscencepsp.php

pkgname=reminiscence
pkgver=0.2.1
pkgrel=1
pkgdesc="A rewrite of the flashback engine"
arch=('i686' 'x86_64')
url="http://cyxdown.free.fr/reminiscence/"
license=('GPL')
depends=('sdl')
makedepends=('p7zip')
source=(http://cyxdown.free.fr/reminiscence/REminiscence-${pkgver}.tar.bz2
        http://gtamp.com/PSP/flashback_data_files.7z
        fix-keys.diff
        reminiscence.sh)
md5sums=('59e7c5b3848c65f8eddb0e8c0e588221'
         'f994412ad4246c587896dab7d2eb9627'
         'e470517e2933c09362681c620938d218'
         '4ed0350e4b81e9ba305f90e157c75371')

build() {
  cd "$srcdir/REminiscence-$pkgver"

  patch -p1 -i "$srcdir/fix-keys.diff"

  make

  install -d "$pkgdir/usr/bin"
  install -m755 rs "$pkgdir/usr/bin/reminiscence.bin"
  install -m755 "$srcdir/reminiscence.sh" "$pkgdir/usr/bin/reminiscence"

  msg2 "Extracting flashback_data_files.7z with p7zip"
  install -m755 -d "$pkgdir/usr/share/reminiscence"
  7z x "$srcdir/flashback_data_files.7z" -o"$pkgdir/usr/share/reminiscence" -y >/dev/null
}

# vim:set ts=2 sw=2 et:
