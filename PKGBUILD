# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=hellspider
pkgver=1.0
pkgrel=2
pkgdesc="Overhead physics shmup with an evolving enemy."
arch=('i686' 'x86_64')
url="http://www.allegro.cc/depot/TransdimensionalHellspider"
license=('GPL3')
depends=('allegro4')
source=(http://downloads.sourceforge.net/project/hellspider/hellspider_src10.zip
        http://downloads.sourceforge.net/project/hellspider/hellspider_win_10.zip)
md5sums=('ae414bc87d5678f8bf38cfabfd2dd4d4'
         '3dd4e7ee1aaa16c1ac01a4062949cb1d')

build() {
  gcc -O2 -Wall *.c -o $pkgname.bin -lm \
        $(allegro-config --cflags --libs) -DUNIX_OSX_VISTA_ETC

    cat <<EOF > hellspider
#!/bin/sh
cd /usr/lib/$pkgname
APPDATA="$HOME" ./hellspider.bin
EOF
}

package()
{
  install -d "$pkgdir"/usr/{bin,lib/$pkgname}
  install -Dm644 *.txt        "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 $pkgname.bin "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 $pkgname     "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/lib/$pkgname"
  cp -R "$srcdir"/{gfx,wavs} .
  chmod -x gfx/*.* wavs/*.wav wavs/beat/*.wav
  mv wavs/beat/{ambiLoo.wav,AmbiLoo.wav}
  mv wavs/beat/{ambiLoo2.wav,AmbiLoo2.wav}
}
