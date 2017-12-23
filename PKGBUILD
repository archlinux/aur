# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=blitzloop
pkgname="$_pkgname-git"
pkgver=r216.c2791c8
pkgrel=1
pkgdesc='Open source karaoke software'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/marcan/blitzloop'
license=('GPL')
depends=('python-opengl' 'python-pympv' 'python-paste' 'python-numpy'
         'python-freetype-py' 'python-bottle' 'python-pillow'
         'python-configargparse' 'python-jaconv')
optdepends=('python-ffms: for blitzloop-record'
            'jack: for microphone feedback')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'cython' 'jack')
source=("$_pkgname::git+https://github.com/marcan/blitzloop")
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
  rm -f "$pkgdir/usr/lib/python3.6/site-packages/blitzloop/_audio.c"
}
