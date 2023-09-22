# Maintainer: willemw <willemw12@gmail.com>

pkgname=cplay-ng-git
pkgver=2.1.0.r200.g137e091
pkgrel=1
pkgdesc='Ncurses front-end for various audio players'
arch=(any)
url=https://github.com/xi/cplay-ng
license=(GPL2)
depends=(libpulse mpv)
makedepends=(git python-build python-installer python-wheel python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C $pkgname clean -dfx
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
