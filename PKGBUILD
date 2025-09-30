# Maintainer: dmnmsc
pkgname=pywebsearch-git
pkgver=r90.e434d8e
pkgrel=1
pkgdesc="Customizable web search tool with aliases, !bangs and GUI (PyQt6)"
arch=('any')
url="https://github.com/dmnmsc/pywebsearch"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-pybrowsers')
provides=('pywebsearch')
conflicts=('pywebsearch')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+https://github.com/dmnmsc/pywebsearch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

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
