# Maintainer: Rich Lindsley <rich at dranek dot com>

_gitname=pyresample

pkgname=pyresample
pkgrel=1
pkgver=v1.13.2.5.ged5ed23
pkgdesc="Geospatial image resampling in Python"
arch=(i686 x86_64)
url="http://pyresample.readthedocs.org"
depends=('python-numpy' 'python-pyproj' 'python-configobj')
optdepends=('python-numexpr: used to optimize some bottlenecks')
makedepends=('git')
options=(!emptydirs)
license=('LGPL3')
source=(git://github.com/pytroll/$_gitname.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build_ext --inplace
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
