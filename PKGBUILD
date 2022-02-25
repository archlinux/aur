# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
_base=pyflakes
pkgname=python-${_base}-git
pkgver=2.4.0.r4.g84da8cd
pkgrel=1
pkgdesc="A lint-like tool for Python to identify common errors quickly without executing code (Git version)"
arch=(any)
url="https://github.com/PyCQA/${_base}"
license=(MIT)
depends=(python-setuptools)
makedepends=(git)
source=(git+${url}.git)
sha512sums=('SKIP')
provides=(python-pyflakes)
conflicts=(python-pyflakes)

pkgver() {
  cd $_base
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  python setup.py build
}

check() {
  cd ${_base}
  python setup.py test
}

package() {
  cd ${_base}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
