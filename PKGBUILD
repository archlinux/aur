# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-easydev
_name=${pkgname#python-}
pkgver=0.15.0
pkgrel=1
pkgdesc="Common utilities to ease development of Python packages"
arch=(any)
license=(BSD-3-Clause)
depends=(python python-colorama python-colorlog python-line-profiler python-pexpect python-platformdirs)
optdepends=('ipython: notebook progress bars'
            'python-docutils: documentation copybutton extension'
            'python-matplotlib: enable functions decorated with ifpylab'
            'python-pandas: enable functions decorated with ifpandas')
makedepends=(python-build python-installer python-poetry-core)
url="https://github.com/cokelaer/easydev"
source=($_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('5a1868cc4b6d8f5dabaeb5cafbb5b16c0df8721e7a81c9879d90e46d81d4f7bb')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
