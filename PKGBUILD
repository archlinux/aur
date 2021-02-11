# $Id$
# Maintainer: Laszlo Papp <lpapp@kde.org>

pkgname=('python-pyang' 'python2-pyang')
pkgver=2.4.0
pkgrel=1
pkgdesc='A YANG (RFC 6020) validator and converter'
url='https://github.com/mbj4668/pyang'
arch=('any')
license=('custom:BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/mbj4668/pyang/archive/pyang-${pkgver}.tar.gz")
sha256sums=('5a34c55a6617e35d01747c66a58e8c716adf6c4ade8a45a245432f65e04e8a98')

prepare() {
  cp -r "pyang-pyang-$pkgver" "python-pyang-$pkgver"
  cp -r "pyang-pyang-$pkgver" "python2-pyang-$pkgver"
}

check_python-pyang() {
  cd "$pkgname-$pkgver"
  python setup.py test

  cd "$pkgname-$pkgver"
  python2 setup.py test
}

package_python-pyang() {
  cd "$pkgname-$pkgver"

  python -m pyang.xpath_parser
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pyang() {
  cd "$pkgname-$pkgver"

  python2 -m pyang.xpath_parser
  python2 setup.py install --root="$pkgdir" --optimize=1
  # mv "$pkgdir"/usr/bin/flask "$pkgdir"/usr/bin/flask2
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

