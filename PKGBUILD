# Maintainer: Nicola Corna <nicola@corna.info>

pkgname=pyghdl-git
pkgver=v1.0.0.r116.9ab4fd18
pkgrel=1
pkgdesc='Python binding for GHDL and high-level APIs'
arch=('any')
url='https://github.com/ghdl/ghdl'
license=('GPLv2')

depends=('ghdl-git' 'python' 'python-pydecor>=2.0.1' 'python-pyvhdlmodel>=0.7.3')
makedepends=('python-setuptools')

source=('ghdl::git+https://github.com/ghdl/ghdl.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ghdl"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/ghdl"
  python setup.py build
}

package() {
  cd "$srcdir/ghdl"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
