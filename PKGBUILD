# $Id: PKGBUILD 174194 2016-05-07 16:45:15Z arojas $
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jeff Bailes <thepizzaking@gmail.com>
 
pkgname=whaawmp
pkgver=0.2.14
pkgrel=3
pkgdesc="GTK+ media player written in python and using GStreamer"
arch=('any')
url='http://home.gna.org/whaawmp/'
license=('GPL3' 'custom')
depends=('gstreamer0.10-python' 'gstreamer0.10-good' 'pygtk' 'python2-xdg' 'desktop-file-utils')
makedepends=('intltool')
optdepends=('gstreamer0.10-bad-plugins: Extra media codecs, DVD menu support'
            'gstreamer0.10-base-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs'
            'gstreamer0.10-good-plugins: Extra media codecs'
            'gstreamer0.10-ugly-plugins: Extra media codecs')
source=(http://download.gna.org/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('b4ce6113879c2ffb50868d5df471380de1fb8800ce2191cc7f0821f1d11a61da')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' src/*.py
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/whaawmp/COPYING"
}
