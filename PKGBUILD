# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-projectq
pkgver=0.4
pkgrel=2
pkgdesc='Open-source framework for quantum computing'
arch=(any)
url=https://projectq.ch
license=(Apache)
depends=(python
         python-numpy
         python-future
         python-pytest
         pybind11
         python-requests
         python-scipy
         python-networkx)
makedepends=(python-setuptools python-sphinx)
source=(https://github.com/ProjectQ-Framework/ProjectQ/archive/v$pkgver.tar.gz)
sha512sums=(8858d2f3d3ca38a4ea6a1e244ce5841708169fbb77c57d3778d868b94128a529cdff188add45ac5999d91e5a2a508917aa592619c54f992c910217fc050fed6e)

build() {
  cd ProjectQ-$pkgver/docs
  make html
}

package() {
  cd ProjectQ-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -d $pkgdir/usr/share/doc/$pkgname
  cp -r {docs/_build/html,examples} $pkgdir/usr/share/doc/$pkgname
  find $pkgdir/usr/share/doc/$pkgname/examples -type f -exec chmod 644 {} +
  install -Dm 644 README.rst $pkgdir/usr/share/doc/$pkgname/README.rst
  install -Dm 644 NOTICE $pkgdir/usr/share/doc/$pkgname/NOTICE
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
