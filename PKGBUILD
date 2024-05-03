# Maintainer:
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

## useful links
# https://pyinfra.com/
# https://github.com/pyinfra-dev/pyinfra

_pkgname="pyinfra"
pkgname="$_pkgname"
pkgver=2.9.2
pkgrel=2
pkgdesc="automate infrastructure super fast at massive scale"
url="https://github.com/pyinfra-dev/pyinfra"
license=('MIT')
arch=('any')

depends=(
  'python'
  'python-click'
  'python-dateutil'
  'python-distro'
  'python-gevent'
  'python-jinja'
  'python-paramiko'
  'python-pywinrm'
  'python-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://github.com/pyinfra-dev/pyinfra/archive/v$pkgver.$_pkgext")
sha256sums=('10a4d7698f60ff142541d7e5c8173147b3613489c720899f3b92e278f2e95789')

prepare() {
  cd "$_pkgsrc"
  rm -rf tests

  sed -E -e '/configparser/d' -i setup.py
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
