# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-elasticsearch-curator
pkgver=3.0.1
pkgrel=1
pkgdesc="Curator: Tending your Elasticsearch indices."
arch=(i686 x86_64)
url=https://github.com/elastic/curator
license=('APACHE')
depends=('python2' 'python2-elasticsearch>=1.0.0' 'python2-elasticsearch<2.0.0' 'python2-click>=3.3')
source=(https://github.com/elastic/curator/archive/v$pkgver.tar.gz)
sha512sums=('dd6e69abd78894171d0afd0eefd23ea4e9bd51a9fc6bcb38611ea537c5dfa447a33e4199861a4748af6478d514f0e2f81e5045f73d88620e623c5286bd16a769')

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