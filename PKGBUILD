# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=miro-video-converter
pkgver=3.0.2
pkgrel=4
pkgdesc="Simple video converter that has presets for popular (Android)phones, iPhones and iPads."
url="http://www.mirovideoconverter.com/"
license=('GPL3')
arch=('any')
depends=('ffmpeg' 'hicolor-icon-theme' 'pygtk')
makedepends=('python2-distribute')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/pculture/mirovideoconverter3/archive/v$pkgver.tar.gz
        $pkgname.install)
md5sums=('cc636577fa810a24fdcc846f5de80efa'
         '6b3443ecc6a059b1b3e6cfa61310931a')

package() {
   cd $srcdir/mirovideoconverter3-$pkgver

   python2 setup.py install --root=$pkgdir --optimize=1

   # Fix Desktop file
   sed -i 's|Media player||' $pkgdir/usr/share/applications/mirovideoconverter.desktop

   # Remove unneeded stuff
   rm -rf $pkgdir/usr/lib/python2.7/site-packages/mvc/{osx,windows,widgets/osx}
}
