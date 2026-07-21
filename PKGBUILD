# Maintainer: Dragonir <dragonir44@gmail.com>
pkgname=wpe-manager
_pyname=wpe_manager
pkgver=0.7.1
pkgrel=1
pkgdesc="Native GUI over linux-wallpaperengine: per-screen assignment & playlist rotation"
arch=('any')
url="https://github.com/Dragonir44/wpe-manager"
license=('MIT')
depends=('python' 'pyside6' 'linux-wallpaperengine-git')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('08dfaa221564cd1949179176938866f4a06bb1f9c7744f63c65804125fe1a5b3')

build() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
