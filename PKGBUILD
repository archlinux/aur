# Maintainer: a821
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Marcin Kulik <m@kulik.com>

pkgname=asciinema-git
pkgver=2.2.0.r18.g5a38576
pkgrel=1
pkgdesc="Record and share your terminal sessions"
arch=('any')
url="https://github.com/asciinema/asciinema"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}
package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
