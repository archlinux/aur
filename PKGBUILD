# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-elasticsearch-curator
pkgver=5.4.1
pkgrel=1
pkgdesc="Curator: Tending your Elasticsearch indices."
arch=(i686 x86_64)
url=https://github.com/elastic/curator
license=('APACHE')
depends=('python2' 'python2-elasticsearch>=5.4.0' 'python2-elasticsearch<7.0.0' 'python2-click>=6.7' 'python2-urllib3>=1.20' 'python2-yaml>=3.10', 'python2-voluptuous>=0.9.3' 'python2-certifi>=2017.7.27.1')
source=(https://github.com/elastic/curator/archive/v$pkgver.tar.gz)
sha512sums=('a2f187d99ebcf8069bfd472316aefe501719400268120c250812670e5525209cebffa913f5fb988305d963bb2a7b61cf47426905b856e34f41afd3a9d67d28f3')

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
