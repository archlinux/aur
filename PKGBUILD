# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=blitzloop
pkgname="$_pkgname-git"
pkgver=r297.6991439
pkgrel=1
pkgdesc='Open source karaoke software'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/marcan/blitzloop'
license=('GPL')
depends=('python-opengl' 'python-pympv' 'python-paste' 'python-numpy'
         'python-freetype-py' 'python-bottle' 'python-pillow'
         'python-configargparse' 'python-jaconv')
optdepends=('jack: for microphone feedback')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'cython' 'jack')
source=("$_pkgname::git+https://github.com/marcan/blitzloop")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d $pkgdir/usr/share/doc/blitzloop
  install -Dm644 docs/*md docs/*conf $pkgdir/usr/share/doc/blitzloop
}
