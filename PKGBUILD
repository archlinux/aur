# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Francois Boulogne <fboulogne at april dot org>
pkgname=python-liblarch-git
_name=liblarch
pkgver=3.2.0.r0.g628f588
pkgrel=3
pkgdesc="Python library to easily handle data structure, with a GTK binding"
arch=('any')
url="https://wiki.gnome.org/Projects/liblarch"
license=('LGPL-3.0-or-later')
depends=('gtk3' 'python-gobject' 'python-cairo')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'xorg-server-xvfb')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/getting-things-gnome/liblarch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  xvfb-run -d pytest
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
