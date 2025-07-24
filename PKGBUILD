# Maintainer: Avery Visentin <averyvisentin@gmail.com>

_pypiname=terminal_tetris
pkgname=terminal-tetris
pkgver=0.0.10
pkgrel=1
pkgdesc="A simple Tetris game for the terminal."
arch=('any')
url="https://github.com/averyvisentin/terminal-tetris"
license=('MIT')

depends=('python-blessed' 'python-installer')
makedepends=('python-setuptools' 'base-devel') # Only setuptools is needed for this method

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pypiname::1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('cc0fe8f333b5e5aa8d67ca6a99e9ad8c3e9db6786e4c704da12d3d9a6551c708')

# This function builds the package from source.
# It is not strictly necessary for this package but is good practice.
build() {
  cd "$_pypiname-$pkgver"
  python -m build --wheel --no-isolation --skip-dependency-check
}

# This function installs the package into the temporary $pkgdir.
package() {
  cd "$_pypiname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # The license should be installed under the Arch package name
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
