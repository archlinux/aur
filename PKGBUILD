# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Francois Boulogne <fboulogne at april dot org>
pkgname=python-liblarch-git
_name=liblarch
pkgver=3.2.0.r0.g628f588
pkgrel=2
pkgdesc="Python library to easily handle data structure, with a GTK binding"
arch=('any')
url="https://wiki.gnome.org/Projects/liblarch"
license=('LGPL3')
depends=('gtk3' 'python-gobject' 'python-cairo')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/getting-things-gnome/liblarch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_name"
  python run-tests
}

package() {
  cd "$srcdir/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
