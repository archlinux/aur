# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=disper
pkgver=0.2.3
pkgrel=2
pkgdesc="An on-the-fly display switch utility, intended to be used on laptops, especially with nVidia cards."
arch=('any')
url="http://willem.engen.nl/projects/disper/"
license=('GPL')
depends=('python2')
source=(https://launchpad.net/~wvengen/+archive/ppa/+files/${pkgname}_${pkgver}.tar.gz)
md5sums=('85b4cde564fc27b7249826e0a4379394')

build() {
  cd "$srcdir/trunk"
  make
}

package() {
  cd "$srcdir/trunk"
  make DESTDIR="$pkgdir" install

  # Patch to use python2
  find "$pkgdir" -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    \{\} +
}
