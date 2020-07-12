# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pyver=2.7
pkgname=python2-future
pkgver=0.18.2
pkgrel=1
pkgdesc="Clean single-source support for Python 3 and 2"
url="http://python-future.org/"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-setuptools: futurize and pasteurize scripts')
options=(!emptydirs)
provides=('futurize' 'pasteurize')
source=("https://pypi.python.org/packages/source/f/future/future-$pkgver.tar.gz")
sha256sums=('b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d')

build() {
  cd future-$pkgver
  python2 setup.py build
}

package() {
  cd future-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/futurize{,$_pyver}
  mv "$pkgdir"/usr/bin/pasteurize{,$_pyver}
  sed -i -e 's|/usr/bin/env python3|/usr/bin/env python2|' \
    "$pkgdir"/usr/lib/python2.7/site-packages/future/backports/test/pystone.py
  install -D -m644 LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
