# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=('python-pybrain')
pkgver=0.3.3
pkgrel=2
pkgdesc='A modular Machine Learning Library for Python'
arch=('any')
url='http://pybrain.org/'
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/pybrain/pybrain#tag=$pkgver"
	"several.patch::https://github.com/pybrain/pybrain/compare/0.3.3...master.patch")
sha512sums=('SKIP'
            'f3ae1ecd6fa5b119a97185ebba2f9f8a3f742ae2f66e751d42314457680ee08e63c3c4fb3a18df051ab1c1224794c0f651f42a5c5bb9d17f1e484bb4fbd1905b')

prepare() {
  cd pybrain
  git apply --stat "$srcdir"/several.patch
}

build() {
  cd pybrain
  python setup.py build
}

package() {
  cd pybrain
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
