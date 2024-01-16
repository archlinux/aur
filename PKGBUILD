# Maintainer:
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

_pkgname="pyinfra"
pkgname="$_pkgname"
pkgver=2.9
pkgrel=1
pkgdesc="pyinfra automates infrastructure super fast at massive scale"
url="https://pyinfra.com/"
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
  'python-yaml'

  'python-setuptools' # silence namcap
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)

_pkgsrc="$_pkgname-$pkgver"
source=("https://github.com/Fizzadar/pyinfra/archive/v$pkgver.tar.gz")
sha256sums=('3c8f71b557a850ae23370b4846d0631110648168c5fe9723051a7bf74ec3f50c')

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
