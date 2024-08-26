# Maintainer:
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

## links
# https://pyinfra.com/
# https://github.com/pyinfra-dev/pyinfra

_pkgname="pyinfra"
pkgname="$_pkgname"
pkgver=3.1
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
  'python-typing_extensions'
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
sha256sums=('b797acbd0c978d69d0e24d18fa1b1cbfdc1ad67691890c12f4784c223aeca1db')

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
