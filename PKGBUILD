# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Gunther Cox <gunthercx at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

_base=chatterbot
pkgname=python-${_base}
pkgver=1.2.1
pkgrel=1
pkgdesc="A machine learning, conversational dialog engine for creating chatbots."
arch=('any')
url="https://github.com/gunthercox/${_base}"
license=('BSD-3-Clause')
depends=('python' 'python-mathparse' 'python-dateutil' 'python-sqlalchemy' 'python-pytz' 'python-tqdm' 'python-django' 'python-yaml' 'python-spacy' 'python-requests' 'python-nltk' 'python-pymongo' 'python-pint' 'python-chatterbot-corpus-git')
checkdepends=('python-sphinx' 'python-nose' 'flake8')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('2eb464a658ee8cd66b5a13be9b7c460535b60f019ef400b4b1326fb029510a1f4db173e2ae1af675fd4f03a9a6118691949bd30a844ef8e7d45644d85a0b1db6')

build() {
  cd "ChatterBot-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "ChatterBot-${pkgver}"
  nosetests
}

package() {
  cd "ChatterBot-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
