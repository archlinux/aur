# Maintainer: elParaguayo <elparaguayocode@gmail.com>
pkgname=qtile-extras-git
_pkgname=qtile-extras
pkgver=0.29.0.r23.ga4de746
pkgrel=1
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc="Unofficial mods for qtile that are unlikely to be maintained in the main repo."
url="https://github.com/elparaguayo/qtile-extras"
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
  git describe --long --tags --abbrev=7 | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
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
