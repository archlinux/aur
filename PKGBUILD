# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-elasticsearch-curator
pkgver=5.1.2
pkgrel=1
pkgdesc="Curator: Tending your Elasticsearch indices."
arch=(i686 x86_64)
url=https://github.com/elastic/curator
license=('APACHE')
depends=('python2' 'python2-elasticsearch>=1.8.0' 'python2-elasticsearch<2.1.0' 'python2-click>=3.3' 'python2-urllib3>=1.8.3')
source=(https://github.com/elastic/curator/archive/v$pkgver.tar.gz)
sha512sums=('4ac0ae789fe662d352c3d228acc6aaf78873bb02b7108f985fd0a048d0b90cb2b30572eaa5f984025ab0d4209eda9d6fe6ac66cd8cc856f0707e3f12bb2e574d')

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
