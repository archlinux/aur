# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=uuid7
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc='UUID version 7, generating time-sorted UUIDs with 200ns time resolution and 48 bits of randomness.'
arch=(any)
url="https://github.com/stevesimmons/uuid7"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
provides=('python-uuid_extensions')
conflicts=('python-uuid_extensions')
replaces=('python-uuid_extensions')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8c57aa32ee7456d3cc68c95c4530bc571646defac01895cfc73545449894a63c')

build() {
    cd "$srcdir"/$_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
