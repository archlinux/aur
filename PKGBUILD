# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=disper
pkgver=0.3.0
pkgrel=1
pkgdesc="An on-the-fly display switch utility, intended to be used on laptops, especially with nVidia cards."
arch=('any')
url="http://willem.engen.nl/projects/disper/"
license=('GPL')
depends=('python2')
source=(http://ppa.launchpad.net/disper-dev/ppa/ubuntu/pool/main/d/disper/disper_${pkgver}.tar.gz)
md5sums=('aff6ca9266eecfc3f646c0de573eca91')
sha256sums=('a8d031757e17a6017b131e9efff5eda7dcf6bc7c78293dbf9d3621566a8bd8d5')

build() {
  cd "$srcdir/dispercur"

  # Patch to use python2
  sed -i -e 's|`src/disper.py|`python2 src/disper.py|' Makefile

  make
}

package() {
  cd "$srcdir/dispercur"
  make DESTDIR="$pkgdir" install

  # Patch to use python2
  find "$pkgdir" -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    \{\} +
}
