# Maintainer: dmnmsc
pkgname=pywebsearch
pkgver=3.6.0
pkgrel=1
pkgdesc="Customizable web search tool with aliases, !bangs and GUI (PyQt6)"
arch=('any')
url="https://github.com/dmnmsc/pywebsearch"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'python-pybrowsers')
provides=('pywebsearch')
conflicts=('pywebsearch-git')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('664bf021cec8a5317bc5865abca75019c5c540efece3095db4e50503576a4d96')

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 resources/pywebsearch.desktop \
   "$pkgdir/usr/share/applications/pywebsearch.desktop"

  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  cp -r resources/linux_icons/* "$pkgdir/usr/share/icons/hicolor/"
}
