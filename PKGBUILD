# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-werkzeug2
_pkgname=python-werkzeug
pkgver=2.0.2
pkgrel=4
pkgdesc='Swiss Army knife of Python web development. Compatible with Odoo 17'
url='https://werkzeug.palletsprojects.com/'
arch=('any')
license=('custom:BSD')
depends=('python-markupsafe')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-pytest-xprocess' 'python-requests'
              'python-ephemeral-port-reserve' 'python-greenlet' 'python-watchdog'
              'python-cryptography')
conflicts=('python-werkzeug')
source=("https://github.com/pallets/werkzeug/archive/${pkgver}/$_pkgname-$pkgver.tar.gz")         
b2sums=('15506d57a8545eb45cb0f4efb78bcc4dfc1faa68910f09dfdd14f4bbb2404078247a7f61475c5fff9058a1557f7f6541eec262fb274e7ed82e1a82b9f644cf8b')

build() {
  cd "werkzeug-$pkgver"

  python -m build --wheel --no-isolation
}

#check() {
#  cd "werkzeug-$pkgver"
#  PYTHONPATH="src" pytest \
#    --deselect=tests/test_serving.py \
#    --deselect=tests/test_debug.py::test_basic \
#    --deselect=tests/middleware/test_http_proxy.py
#}

package() {
  cd "werkzeug-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$_pkgname"
}

# vim:set ts=2 sw=2 et:
