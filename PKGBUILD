# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>

pkgname=python-wikitextparser-git
pkgver=0.48.0.r4.g6e3f6f0
pkgrel=1
pkgdesc="A simple to use WikiText parsing library for MediaWiki."
arch=(any)
url=https://github.com/5j9/wikitextparser
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
  python -c "from setuptools import setup; setup()" build
}

package_python-wikitextparser-git() {
  depends=(python)
  provides=(python-wikitextparser)
  conflicts=(python-wikitextparser)

  cd "$srcdir/$pkgname"
  python -c "from setuptools import setup; setup()" install --optimize=1 --root="$pkgdir/" --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
