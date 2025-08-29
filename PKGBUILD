# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-cleantext
_name=${pkgname#python-}
pkgver=1.1.4
pkgrel=3
pkgdesc='An open-source python package to clean raw text data'
arch=(any)
url=https://pypi.org/project/cleantext
license=(MIT)
depends=(python python-nltk)
makedepends=(python-setuptools)
checkdepends=(nltk-data python-pytest)
source=("https://github.com/prasanthg3/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2922ccef610ff42fa927a13c4f322fb9a0fc5a2d34a6c7ebf67f726e654f3a2a')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
