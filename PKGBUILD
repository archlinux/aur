# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Gunther Cox <gunthercx at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

_base=chatterbot
pkgname=python-${_base}
pkgver=1.2.5
pkgrel=1
pkgdesc="A machine learning, conversational dialog engine for creating chatbots."
arch=('any')
url="https://github.com/gunthercox/${_base}"
license=('BSD-3-Clause')
depends=('python' 'python-mathparse' 'python-dateutil' 'python-sqlalchemy' 'python-pytz' 'python-tqdm' 'python-django' 'python-yaml' 'python-spacy' 'python-requests' 'python-nltk' 'python-pymongo' 'python-pint' 'python-chatterbot-corpus-git')
checkdepends=('python-sphinx' 'python-nose' 'flake8')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('75fec142dc144ce5bdbbf5bacca06025d66b1099cf0cb69dbe98e3cfa1727f50af9f67208493b790286afc830a45068582709a91f93ff2ed197b3a66af5aedc6')

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
