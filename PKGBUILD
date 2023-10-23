# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=flask-appbuilder
_PyName=Flask-AppBuilder
pkgname=python-$_pyname
pkgver=4.3.9
pkgrel=1
arch=(any)
pkgdesc='Simple and rapid application development framework, built on top of Flask'
url='https://github.com/dpgaspar/Flask-AppBuilder'
license=(BSD)
depends=(python-flask-sqlalchemy python-flask-babel python-flask-wtf
         python-flask-limiter python-flask-jwt-extended python-flask-login
         python-prison python-parameterized python-ldap python-pillow
         python-apispec python-yaml python-dateutil python-sqlalchemy-utils
         python-jsonschema python-marshmallow-sqlalchemy python-jmespath
         python-authlib python-mongoengine python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-hiro)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('79dcfe4f03faf102b0dac5114ee8d5b973354802348bc506fd035ec55f7a51e9')

build() {
  cd "$srcdir/$_PyName-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/$_PyName-$pkgver"
  python -m installer dist/*.whl \
    --destdir="$pkgdir" \
    --compile-bytecode=2

  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
