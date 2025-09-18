# Contributor: Valère Monseur <archlinux at vale dot re>

pkgname=python-bootstrap-flask
pkgver=2.5.0
pkgrel=1
pkgdesc="Bootstrap 4 helper for Flask/Jinja2"
url="https://github.com/greyli/bootstrap-flask"
arch=('any')
license=('MIT')
depends=('python' 'python-flask' 'python-markupsafe' 'python-wtforms')
makedepends=('python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest' 'python-flask-sqlalchemy' 'python-flask-wtf')
conflicts=('python-flask-bootstrap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greyli/bootstrap-flask/archive/${pkgver}.tar.gz")
sha512sums=('a4bf8d1152737c9a34f8b516c3eae3dc88bc7ac9332f37652375527b2e618d550da07342fca889fc15870db8e03cb031e3d290d88ecb3d8cb38b81bd701484ab')

build() {
  cd bootstrap-flask-"$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd bootstrap-flask-"$pkgver"
  pytest
}

package() {
  cd bootstrap-flask-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
