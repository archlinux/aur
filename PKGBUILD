# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=python-pcb-tools-extension-git
pkgver=r41.71c371c
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_name=${pkgname#python-}
pkgrel=1
pkgdesc="Temporary fork of pcb-tools-extension including fixes for KiCAD nightlies"
arch=('any')
url="https://git.jaseg.de/pcb-tools-extension.git"
license=('Apache')
depends=("python-dxfgrabber" "python-pcb-tools")
makedepends=('python-setuptools')
source=("${_name%-git}::git+https://git.jaseg.de/${_name%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_name%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_name%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name%-git}"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

