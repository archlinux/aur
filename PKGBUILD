pkgname=geneet-git
_pkgname=geneet
pkgver=0.1.2.84e1b18
pkgrel=1
pkgdesc="Generator for EFL's pickler/unpickler library, EET"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('MIT-custom')
depends=('python2' 'python2-pyparsing')
makedepends=('git' 'python2-distribute')
provides=('geneet')
options=('!libtool')
source=("git://git.enlightenment.org/tools/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(awk -F"'" '/version=/ {print $2}' ./setup.py).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir" || return 1

# install license files
  install -Dm644 COPYING \
    $pkgdir/usr/share/licenses/$_pkgname/COPYING

}
