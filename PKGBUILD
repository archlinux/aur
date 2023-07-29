# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-block_tracing
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=8
pkgdesc="Protect process memory"
arch=('any')
url="https://thelig.ht/code/block-tracing"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('9faa009a702a8f2f605ebb78314d5ca2a2a93543d061038a3d3a978c93385e68'
            'b6fe6404f46a6a82220d921d7854fa8c20c8ea40ff0d0e24748b46878c5d291f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
