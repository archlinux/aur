# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-ghlang
_pypiname=ghlang
pkgver=3.0.0
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
  'python-hatchling'
  'python-installer'
)
source=("https://files.pythonhosted.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('dfcde98533a36ebf177f2320fa0577d01f95579665f22380ab1bf06717d44992')

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
