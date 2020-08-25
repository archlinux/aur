# Maintainer: Nicola Corna <nicola@corna.info>

pkgname=pyghdl-git
pkgver=v0.37.0.r975.1a1e3212
pkgrel=1
pkgdesc='VHDL Language Server and interface to ghdl, a VHDL analyzer'
arch=('any')
url='https://github.com/ghdl/ghdl'
license=('GPLv2')

depends=('ghdl-git' 'python')
makedepends=('python-setuptools')

source=('ghdl::git+https://github.com/ghdl/ghdl.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ghdl"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/ghdl/python"
  python setup.py build
}

package() {
  cd "${srcdir}/ghdl/python"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
