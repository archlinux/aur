# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=python-projectq
pkgver=0.4.2
pkgrel=2
pkgdesc='Open-source framework for quantum computing'
arch=('i686' 'x86_64')
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
makedepends=(python-setuptools python-sphinx python-sphinx_rtd_theme)
source=(https://github.com/ProjectQ-Framework/ProjectQ/archive/v$pkgver.tar.gz)
sha512sums=('ed4364d6e350576f4054f16005d5267a048257586a02ddbe7cd8e4958b755e57842e2c76e0fa0ab53b2d897501f52c13f8a97cd920ecfdc7c2fea28bdf90ff0b')

build() {
  cd "$srcdir"/ProjectQ-$pkgver/docs
  make html

  cd "$srcdir"/ProjectQ-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/ProjectQ-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -d "$pkgdir"/usr/share/doc/$pkgname
  cp -r {docs/_build/html,examples} "$pkgdir"/usr/share/doc/$pkgname
  find "$pkgdir"/usr/share/doc/$pkgname/examples -type f -exec chmod 644 {} +
  install -Dm 644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
  install -Dm 644 NOTICE "$pkgdir"/usr/share/doc/$pkgname/NOTICE
}
