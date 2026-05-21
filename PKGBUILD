pkgname=python-helium
_gitname=helium
pkgver=0.1.0
pkgrel=5
pkgdesc="A layer-shell framework written in C++, configured in Python"
arch=('x86_64')
url="https://github.com/xZepyx/helium"
license=('GPL3')
depends=('python' 'gtk4' 'gtk4-layer-shell' 'pybind11' 'nlohmann-json')
makedepends=('meson' 'python-build' 'python-installer' 'git')
source=("$_gitname::git+https://github.com/xZepyx/helium.git")
sha256sums=('SKIP')
build() {
  cd $_gitname
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$_gitname"
  python -m installer --overwrite-existing --destdir="$pkgdir" dist/*.whl
  install -Dm755 cli/helium "$pkgdir/usr/bin/helium"
}
