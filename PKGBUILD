# Maintainer: yaofanfish <yaofanfish@gmail.com>
pkgname=zetamac-tui-git
_pkgname=zetamac-tui
pkgver=0.1.2.r18.g705f54f
pkgrel=1
pkgdesc="Zetamac clone (identical core interface) with SQLite tracking and more (VCS version)"
arch=('any')
url="https://github.com/yaofanfish/zetamac-tui"
license=('GPL-3.0-or-later')
depends=('python' python-textual python-rich python-pyfiglet)
# someone please make a python-pyminiaudio it doesn't exist

makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel')
provides=("$_pkgname" "python-$_pkgname")
conflicts=("$_pkgname" "python-$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
