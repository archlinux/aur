# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=4chan-downloader
pkgver=1.7.0
pkgrel=1
pkgdesc="A tool to download images from 4chan, 2chan and more!"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/fourchan-dl/"
license=('GPL3')
depends=('qt4')
source=(http://sourceforge.net/projects/fourchan-dl/files/v$pkgver/fourchan-dl-src-v$pkgver.zip
        $pkgname
        $pkgname.desktop)
md5sums=('4f517439357a46ee9e1ac31a6a86a459'
         'a36be476ed2702a5cee6305a58a795e0'
         '54184e14df4d5da32e10e2be19100c87')

prepare() {
  cd $srcdir
  qmake-qt4
}

build() {
  cd $srcdir
  make
}

package() {
  cd $srcdir
  # Binaries
  install -Dm755 fourchan-dl $pkgdir/usr/share/4chan-downloader/fourchan-dl
  install -Dm755 fourchan-dl-console $pkgdir/usr/share/4chan-downloader/fourchan-dl-console
  
  # Plugins
  mkdir -p $pkgdir/usr/share/4chan-downloader/plugins
  cp plugins/*.so $pkgdir/usr/share/4chan-downloader/plugins

  # Start file
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  
  # Desktop icon
  install -Dm644 gui/resources/4chan.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop  
  
  # Make directory writeable
  chmod o+w $pkgdir/usr/share/4chan-downloader
}
