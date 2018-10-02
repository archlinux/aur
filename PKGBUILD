# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-elasticsearch-curator
pkgver=5.5.4
pkgrel=1
pkgdesc="Curator: Tending your Elasticsearch indices."
arch=(i686 x86_64)
url=https://github.com/elastic/curator
license=('APACHE')
depends=('python2' 'python2-elasticsearch>=5.5.2' 'python2-elasticsearch<7.0.0' 'python2-click>=6.7' 'python2-urllib3>=1.20' 'python2-yaml>=3.10', 'python2-voluptuous>=0.9.3' 'python2-certifi>=2018.4.16')
source=(https://github.com/elastic/curator/archive/v$pkgver.tar.gz)
sha512sums=('99ed18592105d19791513ad713115b6e2a6b589ab8b4e3fc4435b2878e25f552e0bda8d63cb6279970afc6ba39d9f3db17af1b4fb44500fe8a14b060e1530258')

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
