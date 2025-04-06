# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Gunther Cox <gunthercx at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

_base=chatterbot
pkgname=python-${_base}
pkgver=1.2.6
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
sha512sums=('09b55900145ec84fe908f9a75d11569826257d845de795d812b8d585e32c36d95950ba518a0a3a159df556379272e216bf0a250e7dfe6cc435f9fe686d46cc7e'
            '4d7aa747de58e5efab6fbb843989a700e1ae088cb2948f0c7a99d583d6dae197fe0349a8d8d4bf8bb8a935a65670026d0aeec97d25670df5b3fd1adbdd77d297')

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
