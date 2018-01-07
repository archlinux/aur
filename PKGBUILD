# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hugo Ideler <hugoideler@dse.nl>
# Maintainer: Jens Persson <xerxes2 at gmail.com>

pkgname=pyid3lib
pkgver=0.5.1
pkgrel=9
pkgdesc="A Python module for editing ID3v2 tags of MP3 audio files"
arch=('x86_64')
url="http://pyid3lib.sourceforge.net/"
license=('LGPL')
depends=('python2' 'glibc' 'id3lib')
source=(https://downloads.sourceforge.net/sourceforge/pyid3lib/$pkgname-$pkgver.tar.gz
	pyid3lib-0.5.1-py25.patch)
sha256sums=('a0534b657cf91726bf93a57112ec9514336d39a93c859cd7afe4d3bf6ae0abcb'
            '07716da15662c5d266a3a184181d4825e391959306819f0eab89cd9993551342')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  [ "${CARCH}" = "x86_64" ] && patch -p1 < ../pyid3lib-0.5.1-py25.patch
  sed -i "s#strchr( str, '/' )#strchr( (char*)str, '/' )#" pyid3lib.cc
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"
}
