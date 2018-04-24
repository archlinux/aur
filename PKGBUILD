# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=termenu
pkgname="${_name}"-git
pkgver=r198.edf68ef
pkgrel=1
pkgdesc="Interactive in-line menus for Unix-based terminals"
arch=('any')
url="https://github.com/elifiner/termenu"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('termenu')
conflicts=('termenu')
options=(!emptydirs)
source=("git+https://github.com/elifiner/termenu.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}"/"${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_name}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${_name}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
