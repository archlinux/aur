pkgname=python-ocpsvg
_build_fragment="commit=83f57aa0b3d5636d64405238f39914917ef9e234"
pkgdesc="Python library to convert between OCP and SVG"
pkgver=0.6.0.r0.g83f57aa
pkgrel=1
arch=('any')
url="https://github.com/snoyer/ocpsvg"
license=(Apache-2.0)
depends=(
python-ocp
python-svgelements
)
makedepends=(
git
python-build
python-installer
python-wheel
python-setuptools
python-setuptools-scm
)
checkdepends=(
python-pytest
)
source=("git+https://github.com/snoyer/ocpsvg.git#${_build_fragment}")
b2sums=('082c2f37a3b9abc9cef774858b7abc31fd7bbd7df2247a8feae92e0188e3f64e13fea10fa7b089297569c7d2b34b21924a3554e2ed5f17d45099a05f87592d6d')

pkgver() {
  cd ocpsvg
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ocpsvg
  python -m build --wheel --no-isolation
}

check() {
  cd ocpsvg
  pytest
}

package() {
  cd ocpsvg
  python -m installer --destdir="$pkgdir" dist/*.whl
}

