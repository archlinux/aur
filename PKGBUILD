# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=blitzloop
pkgname="$_pkgname-git"
pkgver=r157.3423912
pkgrel=1
pkgdesc='Open source karaoke software'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/marcan/blitzloop'
license=('GPL')
depends=('python' 'glfw' 'python-opengl' 'python-pympv' 'python-paste'
         'python-numpy' 'python-freetype-py' 'python-bottle' 'python-pillow'
         'python-configargparse')
optdepends=('python-ffms: for blitzloop-record')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'cython')
# TODO: switch to the official repository once the fixes are in.
#source=("$_pkgname::git+https://github.com/marcan/blitzloop")
source=("$_pkgname::git+https://git.linkmauve.fr/blitzloop.git#branch=no-jack")
md5sums=('SKIP')
options=('!optipng')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
