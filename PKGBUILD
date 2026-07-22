# Maintainer: Dragonir <dragonir44@gmail.com>
pkgname=wpe-manager
_pyname=wpe_manager
pkgver=0.9.0
pkgrel=1
pkgdesc="Native GUI over linux-wallpaperengine: per-screen assignment & playlist rotation"
arch=('any')
url="https://github.com/Dragonir44/wpe-manager"
license=('MIT')
depends=('python' 'pyside6' 'linux-wallpaperengine-git')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('402f9ef0fc803b4765a17457707985624e620c15f3c421266e770a0b07ee0000')

build() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
