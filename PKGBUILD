# Contributor: Roman Voropaev <voropaev.roma@gmail.com>

pkgbase='nginx-unit'
pkgname=('nginx-unitd' 'nginx-unit-python' 'nginx-unit-php')
_shortname='unit'
pkgver=0.3
pkgrel=3
pkgdesc="Dynamic web application server, designed to run applications in multiple languages."
arch=('i686' 'x86_64')
url="http://unit.nginx.org/"
license=('Apache-2.0')
source=($pkgbase-$pkgver.tar.gz::"https://hg.nginx.org/$_shortname/archive/$pkgver.tar.gz")
md5sums=("62ac119c9e345e0b447356b543111b33")
makedepends=('php-embed' 'python')

build() {
  cd "$srcdir"/$_shortname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin
  ./configure python
  ./configure php
  make all
}

package_nginx-unitd() {
  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" unitd-install
}

package_nginx-unit-python() {
  depends=('nginx-unitd' 'python')
  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" python-install
}

package_nginx-unit-php() {
  depends=('nginx-unitd' 'php')
  cd "$srcdir"/$_shortname-$pkgver
  make DESTDIR="$pkgdir" php-install
}
