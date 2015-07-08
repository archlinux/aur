# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-parse-docs
pkgver=1.6.4
pkgrel=1
pkgdesc='Documentation for python-parse and python2-parse'
arch=('any')
url='http://pypi.python.org/pypi/parse'
license=('BSD')
makedepends=('python-docutils')
changelog='Changelog'
source=("http://pypi.python.org/packages/source/p/parse/parse-${pkgver}.tar.gz"
  license.txt)
md5sums=('87bfd55c25d1aea2d7499197254f3a6f'
         'db7ed26afd7dab7d5cb906e06ea68988')

build() {
  cd "$srcdir/parse-$pkgver"
  rst2html README.rst > README.html
}

package() {
  cd "parse-$pkgver"
  local docdir="${pkgdir}/usr/share/doc/python-parse"
  # license from the bottom of parse.py
  install -D -m644 "${srcdir}/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  mkdir -p "$docdir"
  # Include both restructuredText and HTML
  cp README.{rst,html} "$docdir"
}
