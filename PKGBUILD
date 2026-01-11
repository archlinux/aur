# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-ghlang
_pypiname=ghlang
pkgver=2.3.4
pkgrel=1
pkgdesc="Generate language statistics and visualizations from GitHub repositories or local files"
arch=('any')
url="https://github.com/MihaiStreames/ghlang"
license=('MIT')
depends=(
  'python'
  'python-requests'
  'python-matplotlib'
  'python-pillow'
  'python-pyyaml'
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
sha256sums=('1fa875f4be0ac8410da1435df6969b14889bc655b6ea0e6723ccb6fcbcbb1162')

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
