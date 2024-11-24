# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-aiocurl
_name=${pkgname#python-}
pkgver=0.0.3.post1
pkgrel=1
pkgdesc="Using libcurl's socket interface to let asyncio's event loop do all the work of waiting for I/O and scheduling of timeouts."
arch=('any')
url='https://github.com/fsbs/aiocurl'
license=('AGPL-3.0')
depends=('python' 'python-pycurl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('c94549abbd871b245993599badf39b8edcfe13d80847cfaad7a32220e9f0efab')

build() {
  cd "${_name}-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
