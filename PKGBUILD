# Maintainer: Tyler Veness <calcmogul at gmail dot com>
# Contributor: James Duley <jagduley gmail>

pkgname=python-slycot-git
_gitname=Slycot
pkgver=tb04ad_segfault.r72.g7b674d1
pkgrel=1
pkgdesc="Python wrapper for selected SLICOT routines, notably including solvers for Riccati, Lyapunov and Sylvester equations."
arch=('i686' 'x86_64')
url="http://github.com/johannes-scharlach/Slycot"
license=('GPL2')
depends=('python-numpy')
makedepends=('git' 'gcc-fortran')
optdepends=()
provides=('python-slycot')
conflicts=('python-slycot')
source=(git+https://github.com/johannes-scharlach/Slycot.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir/$_gitname"
  python setup.py config_fc --fcompiler=gnu95 install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
