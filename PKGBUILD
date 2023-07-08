# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Rubin Simons <rubin@xs4all.nl>

pkgname=trac
pkgver=1.4.3
pkgrel=1
pkgdesc='Enhanced wiki and issue tracking system for software development projects'
arch=('any')
url="http://trac.edgewall.org/"
license=('BSD')
depends=(python2 python2-jinja python2-setuptools)
makedepends=(python2-babel)
optdepends=('python2-psycopg2: PostgreSQL database support'
            'python2-pygments: Syntax highlighting'
            'python2-docutils: reStructuredText support'
            'python2-babel: localization support'
            'python2-pytz: complete list of time zones')
source=(https://download.edgewall.org/trac/Trac-$pkgver.tar.gz)
sha256sums=('c93ceed9abee6e3c7789f469862e82a3b9bf3405be73aae3221b5c259e062d21')

prepare() {
  cd "$srcdir"/Trac-$pkgver
  sed -i 's:^#!/usr/bin/env python$:#!/usr/bin/env python2:' \
    trac/admin/console.py \
    trac/test.py \
    trac/web/cgi_frontend.py \
    trac/web/fcgi_frontend.py \
    trac/web/standalone.py
}

package() {
  cd "$srcdir"/Trac-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/trac/COPYING
}
