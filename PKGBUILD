# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-ghlang
_pypiname=ghlang
pkgver=2.3.4
pkgrel=1
pkgdesc="Generate language statistics and visualizations from GitHub repositories or local files"
arch=('any')
url="https://github.com/MihaiStreames/ghlang"
license=('MIT')
keywords=('github' 'statistics' 'visualization' 'programming-languages' 'cli')
depends=(
  'python'
  'python-requests'
  'python-matplotlib'
  'python-pillow'
  'python-yaml'
  'python-rich'
  'python-typer'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'cloc: support for local code analysis'
)
source=("https://files.pythonhosted.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('0c39a744e5b08a3db090dc2d7ac85622fc419f48a4a1ad39cd4d34b32786d62b')

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
