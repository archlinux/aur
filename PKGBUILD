# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=python-wikitextparser-git
pkgver=0.47.5.r0.gd61e791
pkgrel=2
pkgdesc="A simple to use WikiText parsing library for MediaWiki."
arch=(any)
url=https://pypi.org/project/wikitextparser/
license=(GPLv3)
makedepends=(python python-setuptools git)
source=("$pkgname::git+https://github.com/5j9/wikitextparser.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package_python-wikitextparser-git() {
  depends=(python)
  provides=(python-wikitextparser)
  conflicts=(python-wikitextparser)

  cd "$srcdir/$pkgname"
  python setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
