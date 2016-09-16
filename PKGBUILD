# Maintainer: Sergio Tridente <tioduke (at) gmail (dot) com>

_pkgname=habitica
pkgname=python-habitica
pkgver=0.0.15
pkgrel=1
pkgdesc="Commandline interface to Habitica."
arch=('any')
url="https://pypi.python.org/pypi/habitica"
license=('MIT')
depends=('python' 'python-docopt' 'python-requests')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/a6/20/65ab6fc5dc8a41b28e08a628096707ae5acf384b7015f1ccaecd9d3d1f25/${_pkgname}-$pkgver.tar.gz"
        auth.cfg.sample)
md5sums=('09de19d6f692a78b07064fcc29c7e2a1'
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
