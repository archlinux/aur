# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

# flashback_data_files.7z if from http://gtamp.com/PSP/reminiscencepsp.php

pkgname=reminiscence
pkgver=0.5.1
pkgrel=1
pkgdesc="A rewrite of the flashback engine"
arch=('i686' 'x86_64')
url="http://cyxdown.free.fr/reminiscence/"
license=('GPL')
depends=('sdl2' 'libmodplug' 'zlib' 'bash')
makedepends=('p7zip')
source=(http://cyxdown.free.fr/reminiscence/REminiscence-${pkgver}.tar.bz2
        http://gtamp.com/PSP/flashback_data_files.7z
        https://github.com/nothings/stb/raw/master/stb_vorbis.c
        reminiscence.sh)
md5sums=('ca480fdaf4cee5fb61d1b20ace1fa0f6'
         'f994412ad4246c587896dab7d2eb9627'
         '36713ac98e445271e29547cc2d90b01f'
         '4ed0350e4b81e9ba305f90e157c75371')
noextract=('flashback_data_files.7z')

build() {
    cd "$srcdir/REminiscence-$pkgver"
    cp "$srcdir/stb_vorbis.c" .

    make
}

package() {
  cd "$srcdir/REminiscence-$pkgver"

  #install -d "$pkgdir/usr/bin"
  install -Dm755 rs "$pkgdir/usr/bin/reminiscence.bin"
  install -Dm755 "$srcdir/reminiscence.sh" "$pkgdir/usr/bin/reminiscence"

  msg2 "Extracting flashback_data_files.7z with p7zip"
  install -m755 -d "$pkgdir/usr/share/reminiscence"
  7z x "$srcdir/flashback_data_files.7z" -o"$pkgdir/usr/share/reminiscence" -y >/dev/null
}

# vim:set ts=2 sw=2 et:
