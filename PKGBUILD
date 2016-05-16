# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-elasticsearch-curator
pkgver=3.5.1
pkgrel=1
pkgdesc="Curator: Tending your Elasticsearch indices."
arch=(i686 x86_64)
url=https://github.com/elastic/curator
license=('APACHE')
depends=('python2' 'python2-elasticsearch>=1.8.0' 'python2-elasticsearch<2.1.0' 'python2-click>=3.3' 'python2-urllib3>=1.8.3')
source=(https://github.com/elastic/curator/archive/v$pkgver.tar.gz)
sha512sums=('59ddc5feb575f626afcbce9c80b113827d9752bb4ba1bc8f7e7f110f8be661314dbf0421310cb07ce1b15c9d6dba2f181718befb5cfa93803ad5e63226ac9556')

build() {
  cd "$srcdir/curator-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/curator-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}

# vim:set ts=2 sw=2 et:
