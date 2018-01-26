# Maintainer: Musikolo <musikoloAThotmailDOTcom>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

# This package is based on the Arch Linux official faad2 package built by Sarah Hay. 
# Thanks Sarah! It just builds the whole faad2 package in the same way, but it 
# includes the --with-xmms switch and put the libmp4.so file in a package.

_srcname=faad2
pkgname=xmms-mp4-plugin
pkgver=2.8.5
pkgrel=1
pkgdesc="ISO AAC audio decoder"
arch=('i686' 'x86_64')
url="http://www.audiocoding.com/"
license=('GPL')
depends=('glibc' 'xmms')
makedepends=('id3lib')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/faac/${_srcname}-${pkgver}.tar.gz)
sha256sums=('ba7364ba8ff9256abb8aa4af8736f27d0b7eaab51c14ff828cc86aabff33ec65')

build() {
   cd ${_srcname}-${pkgver}
   ./configure --prefix=/usr --with-xmms
   make CFLAGS="${CFLAGS} -fPIC"
}

package(){
  cd ${srcdir}/${_srcname}-${pkgver}
  install -D -m644  ${srcdir}/${_srcname}-${pkgver}/plugins/xmms/src/.libs/libmp4.so ${pkgdir}`xmms-config --input-plugin-dir`/libmp4.so
}
