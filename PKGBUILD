# Maintainer: Arzet Ro (arzeth0@gmail.com)

pkgname=python-httpx-auth
_pkgname="${pkgname#python-}"
_pkgname="${_pkgname//-/_}"
pkgver=0.23.1
pkgrel=1
pkgdesc="Authentication classes to be used with HTTPX"
arch=('any')
url="https://github.com/Colin-b/httpx_auth"
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-distribute' 'python-wheel' 'python-build' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/h/httpx-auth/httpx_auth-$pkgver.tar.gz)
sha384sums=('caaed529b03b44aebb53abc801c01f0380463ca13f122be8c90211f372ad1e5d043cc7c24a81596c82c00289eaba2198')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python -m build --wheel --no-isolation
}

# untested, therefore commented:
#check() {
#  local pytest_options=(
#    -vv
#  )
#  cd "${srcdir}"/${_name}-${pkgver}
#  python -m venv --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest "${pytest_options[@]}" tests
#}


package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
