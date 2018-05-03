# Maintainer: Tyler Veness <calcmogul at gmail dot com>
# Contributor: James Duley <jagduley gmail>

pkgname=python-slycot-git
pkgver=186.a41ac6e
pkgrel=1
pkgdesc="Python wrapper for selected SLICOT routines, notably including solvers for Riccati, Lyapunov and Sylvester equations."
arch=('i686' 'x86_64')
url="http://github.com/python-control/Slycot"
license=('GPL2')
depends=('python-numpy-openblas')
makedepends=('git' 'gcc-fortran')
optdepends=()
provides=('python-slycot')
conflicts=('python-slycot')
source=(git+https://github.com/python-control/Slycot.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Slycot"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir/Slycot"
  python setup.py config_fc --fcompiler=gnu95 install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
