# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=speechmatics-rt
pkgname=python-$_name
pkgver=1.1.1
pkgrel=1
pkgdesc="Speechmatics Real-Time API Client."
arch=('any')
url="https://github.com/speechmatics/speechmatics-python-sdk/tree/main/sdk/rt"
license=('MIT')
depends=('python' 'python-websockets')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-aiohttp: jwt')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('c560df8edcf0af3a565310f1a744feee9a9c0bb35e665225305ae7e7343a390f')

prepare() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  rm ${_name//-rt/}/__init__.py
}

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
