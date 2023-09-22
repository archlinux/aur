# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-code-chat-git
pkgver=1.5.1.r242.g6809e75
pkgrel=1
pkgdesc='Source code to HTML translator (literate programming)'
arch=(any)
url=https://github.com/bjones1/CodeChat
license=(GPL3)
depends=(python-docutils)
makedepends=(git python-build python-installer python-wheel python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
