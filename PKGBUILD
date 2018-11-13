# $Id$
# Maintainer: Laszlo Papp <lpapp@kde.org>

pkgname=('python-pyang' 'python2-pyang')
pkgver=1.7.5
pkgrel=1
pkgdesc='A YANG (RFC 6020) validator and converter'
url='https://pypi.python.org/pypi/pyang'
arch=('any')
license=('custom:BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/mbj4668/pyang/archive/pyang-${pkgver}.tar.gz")
sha256sums=('94ea421ef66d79068446f99c121ec27a57638fa5d67cc10aab8fe47cd8285a5b')

prepare() {
  cp -r "pyang-pyang-$pkgver" "python-pyang-$pkgver"
  cp -r "pyang-pyang-$pkgver" "python2-pyang-$pkgver"
}

build_python-pyang() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

build_python2-pyang() {
  cd "$pkgname-$pkgver"

  python2 setup.py build
}

check_python-pyang() {
  cd "$pkgname-$pkgver"
  python setup.py test

  cd "$pkgname-$pkgver"
  python2 setup.py test
}

package_python-pyang() {
  cd "$pkgname-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pyang() {
  cd "$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  # mv "$pkgdir"/usr/bin/flask "$pkgdir"/usr/bin/flask2
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

