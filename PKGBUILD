# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Clément Démoulins <clement@archivel.fr>

pkgname=python-tvdb_api-git
pkgver=3.1.r6.gce03821
pkgrel=1
pkgdesc='Easy to use interface to thetvdb.com'
arch=(any)
url=https://github.com/dbr/tvdb_api
license=(GPL)
depends=(python-requests-cache)
makedepends=(git python-build python-installer python-wheel python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
