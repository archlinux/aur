# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-fusepyng
_name=${pkgname#python-}
pkgver=1.0.7
pkgrel=7
pkgdesc="Simple ctypes bindings for FUSE"
arch=('any')
url="https://thelig.ht/code/fusepyng"
license=('ISC')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('8b4f6ef81e8600f23da7509169acb2615582ef116d46a2a1ad4b7e530d8f899f'
            'e61e6b2171e77a5da5a6b8bdb1e588dd0c660fd2ac64342cded4ab53cf3d4140')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
