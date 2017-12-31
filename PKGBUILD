# Contributor: Roman Voropaev <voropaev.roma@gmail.com>

pkgbase=nginx-unit
pkgname=('nginx-unit-python' 'nginx-unit-php')
_shortname=unit
pkgver=0.3
pkgrel=1
pkgdesc="Dynamic web application server, designed to run applications in multiple languages."
arch=('i686' 'x86_64')
url="http://unit.nginx.org/"
license=('Apache-2.0')
optdepends=('python' 'php-embed')
source=(http://hg.nginx.org/$_shortname/archive/$pkgver.tar.gz)
md5sums=(62ac119c9e345e0b447356b543111b33) 

build() {
  cd $srcdir/$_shortname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package_nginx-unit-python() {
  cd $srcdir/$_shortname-$pkgver
  ./configure python
  make python
  make DESTDIR=$pkgdir install || return 1
}

package_nginx-unit-php() {
  cd $srcdir/$_shortname-$pkgver
  ./configure php
  make php
  make DESTDIR=$pkgdir install || return 1
}
