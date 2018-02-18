# Maintainer: Sergio Tridente <tioduke (at) gmail (dot) com>

_pkgname=habitica
pkgname=python-habitica
pkgver=0.0.16
pkgrel=1
pkgdesc="Commandline interface to Habitica."
arch=('any')
url="https://pypi.python.org/pypi/habitica"
license=('MIT')
depends=('python-docopt' 'python-requests')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/2a/f3/4aa50300d1468e0fbfdb2b900927c6c786310ed2943771d1da6fa47fcebd/${_pkgname}-$pkgver.tar.gz"
        auth.cfg.sample)
md5sums=('74186c1d3b8e0b99677a4cca865db443'
         '73203917ea9a075cafaf287f9d707a15')


build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 README.md "$pkgdir"/usr/share/doc/${_pkgname}/README.txt
  install -Dm644 "$srcdir"/auth.cfg.sample "$pkgdir"/usr/share/examples/${_pkgname}/auth.cfg.sample
}
