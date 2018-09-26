# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: paterbrown <paterbrown at silberhelme dot de>

pkgname=gst123
pkgver=0.3.5
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
            'gst-plugins-bad: more codecs support'
            'gst-plugins-ugly: more codecs support')
source=("http://space.twc.de/~stefan/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('384538b35522baf539ca49d4fa5f71fd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # replace ncurses6 with ncursesw6
  sed -i "s_ncurses5_ncursesw6_g" configure*

  # gtkwindow appears twice (workaround fix) - seems to be gone?
#  sed -i '/ rc/d' src/gtkinterface.cc

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
