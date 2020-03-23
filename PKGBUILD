# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=python-projectq
pkgver=0.5.0
pkgrel=4
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
makedepends=(python-setuptools python-sphinx python-sphinx_rtd_theme python-matplotlib)
source=(https://github.com/ProjectQ-Framework/ProjectQ/archive/v$pkgver.tar.gz)
sha512sums=('5cf965dd43f29aae2f3e7ad13c5f2a770b23542d0a7e4f697b0c04cbd3150bff399b658b9cc4b08f3b4f1c05447d9dda5105a4843e3a2dfe578738d3d9c663bc')

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
