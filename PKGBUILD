#Maintainer: Avery Visentin <averyvisentin@gmail.com>

pypiname=terminal_tetris
pkgname=terminal-tetris
pkgver=0.0.3
pkgrel=1
pkgdesc="A simple Tetris game for the terminal."
arch=('any')
url="https://github.com/averyvisentin/terminal-tetris"
license=('MIT')

depends=('python-blessed')
makedepends=('python-setuptools' 'python-wheel' 'python-build')

# Use the _pypiname variable to build the correct download URL
source=("$pypiname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$pypiname/$pypiname-$pkgver.tar.gz")

sha256sums=('cfc1db073db5fbc8bcb9c87d43f57977366e88b98e7492ca477d6872d4b6d72e')

# This function installs the package into a temporary directory ($pkgdir).
package() {
  # The extracted source directory uses the PyPI name
  cd "$pypiname-$pkgver"

  python -m build --wheel --no-isolation
  pip install --root="$pkgdir" --no-deps --no-user dist/*.whl

  # The license should be installed under the Arch package name
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
