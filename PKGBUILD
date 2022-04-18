# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-nunavut-git
pkgver=r132.bcf5ba5
pkgrel=1
pkgdesc='Generate Code from DSDL using pydsdl and jinja2'
arch=('x86_64')
url='https://uavcan.org'
license=('MIT')
depends=('python' 'python-pydsdl' 'python-pyyaml' 'python-importlib_resources')
optdepends=()
makedepends=('python' 'python-setuptools' 'git')
provides=('python-nunavut')
conflicts=('python-nunavut')
_pkgname=nunavut
source=("${_pkgname}::git+https://github.com/UAVCAN/nunavut")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
