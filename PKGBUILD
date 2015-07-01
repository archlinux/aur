# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-elasticsearch-curator
pkgver=3.2.0
pkgrel=1
pkgdesc="Curator: Tending your Elasticsearch indices."
arch=(i686 x86_64)
url=https://github.com/elastic/curator
license=('APACHE')
depends=('python2' 'python2-elasticsearch>=1.6.0' 'python2-elasticsearch<2.0.0' 'python2-click>=3.3' 'python2-urllib3>=1.8.3')
source=(https://github.com/elastic/curator/archive/v$pkgver.tar.gz)
sha512sums=('9b7a7a6f5795a8236f396c7e0b534039c22d7b2f7e4f9f64f75cec5660db774c1c7f57a4c5e280973e5b6cc0c87ea75ed9f5a61a533565988a9463da0b922b2f')

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
