# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-ghlang
_pypiname=ghlang
pkgver=2.4.1
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
optdepends=(
  'tokount: local directory analysis with ghlang local'
)
source=("https://files.pythonhosted.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('18ff437c8bf8d80a96e72e37f286353dbe355dc3f13befbae1bb38323edf0307')

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
