# Maintainer: elParaguayo <elparaguayocode@gmail.com>
pkgname=qtile-extras-git
_pkgname=qtile-extras
pkgver=r262.c997a9d
pkgrel=1
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc="Unofficial mods for qtile that are unlikely to be maintained in the main repo."
url="https://github.com/elparaguayo/qtile-extras.git"
arch=("any")
license=("MIT")
depends=("python" "qtile")
makedepends=(
  "git"
  "python-setuptools"
  "python-setuptools-scm"
  "python-wheel"
  "python-installer"
  "python-build"
)
source=("git+https://github.com/elparaguayo/$_pkgname.git")
md5sums=("SKIP")

pkgver()
{
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package()
{
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
