# Maintainer: Tyler Veness <calcmogul at gmail dot com>
# Contributor: James Duley <jagduley gmail>

pkgname=python-slycot-git
_gitname=Slycot
pkgver=140.234447c
pkgrel=2
pkgdesc="Python wrapper for selected SLICOT routines, notably including solvers for Riccati, Lyapunov and Sylvester equations."
arch=('i686' 'x86_64')
url="http://github.com/jgoppert/Slycot"
license=('GPL2')
depends=('python-numpy-openblas')
makedepends=('git' 'gcc-fortran')
optdepends=()
provides=('python-slycot')
conflicts=('python-slycot')
source=(git+https://github.com/jgoppert/Slycot.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir/$_gitname"
  python setup.py config_fc --fcompiler=gnu95 install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
