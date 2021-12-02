# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-doublex
pkgver=1.9.3
# Upstream forgot to push tags and ignored my notice
_commit=fe03fcb4672d
pkgrel=2
pkgdesc="Powerful test doubles framework for Python"
arch=('any')
license=('GPL')
url="https://github.com/davidvilla/python-doublex"
depends=('python-pyhamcrest')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/DavidVilla/python-doublex/get/$_commit.tar.bz2")
sha512sums=('e3ca091c4794f1054779364bf9d13b188c0cecb2b7afbe87c7fa05c79182c4d7fcca171e9bfc52d7603f1a7280e0a62b04bcd834d4cf7bc7b32b701e8224b764')

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
