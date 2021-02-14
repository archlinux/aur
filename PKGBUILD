# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=python-pcb-tools-git
pkgver=r483.7225725
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_name=${pkgname#python-}
pkgrel=1
pkgdesc="Tools to handle Gerber and Excellon files in Python"
arch=('any')
url="https://github.com/curtacircuitos/pcb-tools"
license=('Apache')
depends=('python-cairocffi>=0.6')
makedepends=('git' 'python-setuptools')
source=("${_name%-git}::git+https://github.com/curtacircuitos/${_name%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_name%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check(){
  cd "$srcdir/${_name%-git}"
  # pytest
  return 0
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

