# Maintainer:
# Contributor: Stephanie Wilde-Hobbs (RX14) <steph@rx14.co.uk>

_module="asyncio-dgram"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=2.2.0
pkgrel=1
pkgdesc="Higher level Datagram support for Asyncio"
url="https://github.com/jsbronder/asyncio-dgram"
license=('MIT')
arch=('any')

depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('5a1aa6b2d1247a8ad0222ae83f789edfb49a413e912607bb827976c94711293d')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
