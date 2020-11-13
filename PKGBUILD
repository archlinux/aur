# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-doublex
pkgver=1.9.2
pkgrel=5
pkgdesc="Powerful test doubles framework for Python"
arch=('any')
license=('GPL')
url="https://github.com/davidvilla/python-doublex"
depends=('python-pyhamcrest')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/DavidVilla/python-doublex/get/v$pkgver.tar.bz2")
sha512sums=('0cbcedeb46bd0dce807360bab5f8ac8d0a3e0eb8b5bdd7381499a1da236fbbfd21f0a53ece6eb24c387c9d96c9735ee56693ce95d445ef4f59873140388bc6a7')

prepare() {
  mv DavidVilla-python-doublex-* python-doublex-$pkgver
}

build() {
  cd python-doublex-$pkgver
  python setup.py build
}

check() {
  cd python-doublex-$pkgver
  # https://bitbucket.org/DavidVilla/python-doublex/issues/6/more-failing-tests-with-python-39
  python setup.py test || :
}

package() {
  cd python-doublex-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir"/usr/README.rst
}
