# Maintainer: Scott Hansen (firecat53) tech at firecat53 dot net
pkgname=urlscan-git
_gitname=urlscan
pkgver=r182.9505e7c
pkgrel=1
pkgdesc="Replacement for urlview with html context and other improvements."
arch=('any')
url="https://github.com/firecat53/urlscan"
license=('GPL2')
conflicts=('urlscan')
provides=('urlscan')
depends=('python' 'python-urwid')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=('git+https://github.com/firecat53/urlscan.git')
md5sums=('SKIP')
install=urlscan.install

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
