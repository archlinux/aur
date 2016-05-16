# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Lucas Salies Brum <lucas at archlinux dot com dot br>
# Contributor: max.bra <max.bra at alice dot it>

pkgname=pyrenamer
pkgver=0.6.0
pkgrel=10
pkgdesc="Mass file renamer"
arch=('any')
url="http://www.infinicode.org"
license=('GPL2')
depends=('python2-gconf')
makedepends=('perl-xml-parser')
optdepends=('hachoir-metadata: rename multimedia files metadata'
            'python2-eyed3: rename MP3 files metadata')
source=(http://http.debian.net/debian/pool/main/p/$pkgname/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('a7159f803cd919ab76f17789189c577b')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|python python2 python2.5|python2 python2.5|' configure
  sed -i 's|PYTHON=python|PYTHON=python2|' py-compile
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' src/$pkgname doc/treefilebrowser_example.py
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
