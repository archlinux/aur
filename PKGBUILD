# Maintainer: dmnmsc
pkgname=pywebsearch
pkgver=3.6.5
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
sha256sums=('c35963846b172235147ca94586918833b9c13ad271b91e07aca9028b92526e57')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 resources/pywebsearch.desktop \
   "$pkgdir/usr/share/applications/pywebsearch.desktop"

  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  cp -r resources/linux_icons/* "$pkgdir/usr/share/icons/hicolor/"
}
