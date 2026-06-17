# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=speechmatics-rt
pkgname=python-$_name
pkgver=1.1.0
pkgrel=1
pkgdesc="Speechmatics Real-Time API Client."
arch=('any')
url="https://github.com/speechmatics/speechmatics-python-sdk/tree/main/sdk/rt"
license=('MIT')
depends=('python' 'python-websockets')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-aiohttp: jwt')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9fbf948b93212dfbf698026533126c472a67098f1f0e3d97ed6e2f1201b10712')

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
