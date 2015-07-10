# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: paterbrown <paterbrown at silberhelme dot de>

pkgname=gst123
pkgver=0.3.3
pkgrel=1
pkgdesc="A more flexible command line player in the spirit of ogg123 and mpg123, based on gstreamer"
arch=('i686' 'x86_64')
url="http://space.twc.de/~stefan/gst123.php"
license=('LGPL')
depends=('gst-plugins-base-libs' 'gtk2')
optdepends=('xdg-utils: disable screensaver during playback')
makedepends=('ncurses')
optdepends=('gst-libav: more codecs support'
            'gst-plugins-base: more codecs support'
            'gst-plugins-good: more codecs support'
            'gst-plgusin-bad: more codecs support'
            'gst-plugins-ugly: more codecs support')
source=("http://space.twc.de/~stefan/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('42fb711480238b89db8889847c1ec99e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # replace ncurses5 with ncursesw5
  sed -i "s_ncurses5_ncursesw5_g" configure*

  # gtkwindow appears twice (workaround fix) - seems to be gone?
#  sed -i '/ rc/d' src/gtkinterface.cc

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
