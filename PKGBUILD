# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>
# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=python2-html2text
pkgver=2015.4.14
pkgrel=1
pkgdesc="Converts a page of HTML into clean, easy-to-read plain ASCII text."
arch=('any')
url="https://github.com/Alir3z4/html2text/"
license=('GPL3')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=("http://pypi.python.org/packages/source/h/html2text/html2text-$pkgver.tar.gz")

build() {
  cd "$srcdir/html2text-$pkgver"
  python2 setup.py build
}

check(){
  cd "$srcdir/html2text-$pkgver"
  PYTHONPATH=$PYTHONPATH:. python2 setup.py test --verbose
}

package() {
  cd "$srcdir/html2text-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m755 "$pkgdir/usr/bin/html2text" "$pkgdir/usr/bin/html2text_py"
  # Install python-html2text for the bin file
  rm "$pkgdir/usr/bin/html2text"
}
# vim:set ts=2 sw=2 et:
sha256sums=('b966f618423e12b202f53652a57ea28b9d95861882f93658dcbd7d899603aa85')
