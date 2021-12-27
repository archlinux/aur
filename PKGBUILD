# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Nicola Corna <nicola@corna.info>

_pkgname=python-pyghdl
pkgname=$_pkgname-git
pkgver=1.0.0.r946.7e41be2da
pkgrel=1
pkgdesc='Python binding for GHDL and high-level APIs'
arch=('any')
url='https://github.com/ghdl/ghdl'
license=('GPL2')

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
replaces=('pyghdl-git')
depends=('ghdl-git' 'python' 'python-pyattributes' 'python-pytooling' 'python-pytooling-terminalui' 'python-pyvhdlmodel')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest')

source=('ghdl::git+https://github.com/ghdl/ghdl.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ghdl"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/ghdl"
  python setup.py build
}

check() {
  cd "$srcdir/ghdl"

  env PYTHONPATH="$PWD" pytest testsuite/pyunit
}

package() {
  cd "$srcdir/ghdl"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim: set et ts=2:
