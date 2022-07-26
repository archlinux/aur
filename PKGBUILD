# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-kiss-headers
_name=${pkgname#python-}
pkgver=2.3.1
pkgrel=2
pkgdesc="Python package for HTTP/1.1 style headers. Parse headers to objects."
arch=('any')
url="https://www.kiss-headers.tech"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('86e80d58da2af71fdb7c3adfe57544442fd0595928a95f6e8a9d490aa6ea29aa')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
