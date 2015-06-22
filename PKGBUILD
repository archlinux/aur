# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Antony Ho <ntonyworkshop@gmail.com>
pkgname=python2-pycanberra-git
pkgver=8.88c53cd
pkgrel=1
pkgdesc="simple wrapper around most of the libcanberra public api"
arch=(any)
url="https://github.com/psykoyiko/pycanberra"
license=('(L)GPL2')
depends=('libcanberra' 'python2')
makedepends=('git')
replaces=('python2-pycanberra')
conflicts=('python2-pycanberra')
_gitroot=
_gitname="pycanberra"
_python_ver=2.7

source=("git://github.com/psykoyiko/pycanberra.git")
sha1sums=('SKIP')

build() {
  cd pycanberra
  python2 -c 'import compileall, sys; \
              sys.exit(not \
              compileall.compile_file("pycanberra.py", ddir=".", force=1))'
}

pkgver() {
  cd pycanberra
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $revision.$hash  
}

package() {
  mkdir -p $pkgdir/usr/lib/python${_python_ver}/site-packages
  install -p -m 0644 $srcdir/$_gitname/pycanberra.py* $pkgdir/usr/lib/python${_python_ver}/site-packages
} 
