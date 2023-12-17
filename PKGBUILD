# Maintainer: Scott Hansen (firecat53) tech at firecat53 dot net
pkgname=tabview-git
pkgver=r226.77846ac
pkgrel=1
pkgdesc="Curses CSV/tabular data viewer"
arch=('any')
url="https://github.com/tabviewer/tabview"
license=('MIT')
conflicts=('tabview')
provides=('tabview')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/tabviewer/tabview.git")
_gitname="tabview"
md5sums=('SKIP')

prepare() {
  git -C "$_gitname" clean -dfx
}

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  python -m build --wheel --no-isolation
}
  
package() {
  cd "$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
