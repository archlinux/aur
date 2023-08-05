# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-fusepyng
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Simple ctypes bindings for FUSE"
arch=('any')
url="https://thelig.ht/code/fusepyng"
license=('ISC')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1d7d5449b1aea9677297fe3fa0e0a14b66f17ed32485f0746c9fa6104a5e282c')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
