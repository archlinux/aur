# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tarmo Heiskanen <turskii@gmail.com>

pkgname=python38-flask
pkgver=2.2.2
pkgrel=1
pkgdesc='Micro webdevelopment framework for Python'
url='http://flask.pocoo.org/'
arch=('any')
license=('custom:BSD')
depends=('python38-werkzeug' 'python38-jinja' 'python38-itsdangerous' 'python38-click')
makedepends=('python38-build' 'python38-installer' 'python38-wheel' 'python38-setuptools')
checkdepends=('python38-pytest')
optdepends=(
  'python38-asgiref: async functions and views'
  'python38-dotenv: loading env vars from files'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets/flask/archive/${pkgver}.tar.gz")
sha512sums=('ab069d27fdfc056a3cdde2fa7f89486781fbf4fa396c0dde20e99458b76790f83cda4e4acba23f598bc0a86c68a80d7b2c58657ad0b2c67b5ad1bb997185db2a')

build() {
  cd "flask-$pkgver"
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "flask-$pkgver"
  PYTHONPATH="build/lib" pytest
}

package() {
  cd "flask-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
