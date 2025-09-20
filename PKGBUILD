# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=flask-security
pkgname=python-flask-security
pkgver=5.6.2
pkgrel=1
pkgdesc='Quick and simple security for Flask applications'
url='https://github.com/pallets-eco/flask-security'
arch=('any')
license=('MIT')
depends=('python' 'python-babel' 'python-blinker' 'python-click' 'python-flask' 'python-flask-babel' 'python-flask-login' 'python-flask-mail' 'python-flask-principal'
         'python-flask-wtf' 'python-importlib_resources' 'python-itsdangerous' 'python-markupsafe' 'python-passlib'
         'python-email-validator' 'python-werkzeug' 'python-wtforms')
makedepends=('python-build' 'python-flit-core' 'python-installer')
#checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-cache'
              #'python-mock' 'python-sqlalchemy' 'python-flask-sqlalchemy' 'python-bcrypt' 'python-pony')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pallets-eco/flask-security/archive/${pkgver}.tar.gz)
sha512sums=('0d80a8642d3523161b9744411ddeb075c00c75d287020a7874ad9db92f8080f49a4fc3486f292369b5ff3b7427c757731d4a006297671bd55c07a803602cd1b7')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -e 's/ --translations//' \
      -e 's/ --pep8//' \
      -e 's/ --flakes//' \
      -i pytest.ini
}

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
#  sphinx-build -b text docs docs/_build/text
#  sphinx-build -b man docs docs/_build/man
}

# TODO: test marks not compatible with latest pytest
#check() {
  #cd ${_pkgname}-${pkgver}
  #PYTHONPATH=. py.test
  #PYTHONPATH=. py.test2
#}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm 644 README.rst CHANGES.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
#  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
#  install -Dm 644 docs/_build/man/flask-security.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
