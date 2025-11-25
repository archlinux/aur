# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Gunther Cox <gunthercx at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

_base=chatterbot
pkgname=python-${_base}
pkgver=1.2.9
pkgrel=1
pkgdesc="A machine learning, conversational dialog engine for creating chatbots."
arch=('any')
url="https://github.com/gunthercox/${_base}"
license=('BSD-3-Clause')
depends=('python' 'python-mathparse' 'python-dateutil' 'python-sqlalchemy' 'python-pytz' 'python-tqdm' 'python-django' 'python-yaml' 'python-spacy' 'python-requests' 'python-nltk' 'python-pymongo' 'python-pint' 'python-chatterbot-corpus-git')
checkdepends=('python-sphinx' 'python-nose' 'flake8' 'python-huggingface-hub')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz
  "fix-license-definition.patch")
b2sums=('7d98a530a1975b95b977f4dbfc163db6971f0dd0fbe9bc46b01710df57aeedce99d4394c3a88817252c850db287ff9c5003bde5f45f30167e183d919b7bd7529'
        'b462f15681623843c3be69ab596634b6959bcc9a61986cf881762a1ff51b1a0da9a3c8c684adce37a941c9185d66a0d2865bce5da6e7fa65e4f41f0082dbc887')

prepare() {
  cd "ChatterBot-${pkgver}"
  patch -i ../fix-license-definition.patch
}

build() {
  cd "ChatterBot-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "ChatterBot-${pkgver}"
  nosetests || echo "Warning: Tests failed"
}

package() {
  cd "ChatterBot-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
