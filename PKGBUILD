# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=fal-client
pkgname=python-$_name
pkgver=1.0.1
pkgrel=1
pkgdesc='Python client for fal.ai.'
arch=('any')
url='https://github.com/fal-ai/fal/tree/main/projects/fal_client'
license=('Apache-2.0')
depends=('python' 'python-aiofiles' 'python-asyncstdlib' 'python-httpx' 'python-httpx-sse' 'python-msgpack' 'python-websockets')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-pillow')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('46d1cee3426d0a2ad34f32b7dbfbdff83487c3dcf8aeae1aac2ffd5815e2055c')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
