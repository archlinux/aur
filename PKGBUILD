# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: milko

pkgname=arnold
pkgver=2009.05.31
pkgrel=3
pkgdesc="An Amstrad CPC emulator using SDL with a GTK+ interface"
arch=('i686' 'x86_64')
url="http://www.yasara.org/cpc/"
depends=('sdl' 'libgl' 'gtk2' 'alsa-lib' 'pulseaudio')
license=('GPL')
source=("http://www.yasara.org/cpc/arnold_tng.zip" arnold.desktop arnold.png)
md5sums=('b9fcee41371a3d16b1ce2e268778a2c6'
         'd9ef043bfb472c30b58f858c4fbd80ef'
         '7914c93646818037948eebba293520bc')

build() {
  cd "$srcdir"/arnold_tng/src

  ./configure
  sed -e 's/-DHAVE_SDL=1/-DHAVE_SDL=1 -DHAVE_GL=1/g' -e 's/-lSDL/-lSDL -lGL/g' -i Makefile
  make clean
  make

}
package () {
  cd "$srcdir"/arnold_tng/src

  install -D  ../arnold "$pkgdir"/usr/bin/arnold
  install -D -m644 "$srcdir"/arnold.desktop "$pkgdir"/usr/share/applications/arnold.desktop
  install -D -m644 "$srcdir"/arnold.png "$pkgdir"/usr/share/pixmaps/arnold.png
}
