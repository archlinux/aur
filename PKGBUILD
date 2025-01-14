# Maintainer:
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

## links
# https://pyinfra.com/
# https://github.com/pyinfra-dev/pyinfra

_pkgname="pyinfra"
pkgname="$_pkgname"
pkgver=3.2
pkgrel=1
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
  'python-packaging'
  'python-paramiko'
  'python-typeguard'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://github.com/pyinfra-dev/pyinfra/archive/v$pkgver.$_pkgext")
sha256sums=('7da8d0dc2a5fba37b221c26de2510167d32db8aa0ff1fe4417ee2266c007e285')

prepare() {
  cd "$_pkgsrc"
  rm -rf tests
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
