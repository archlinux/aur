# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python2-hpgl-git
pkgver=0.1.0.r0.gc06e73b
pkgrel=1
pkgdesc="Python HPGL Parsing Library"
arch=('any')
url="https://github.com/alexforencich/python-hpgl"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('python2-hpgl')

_gitroot='https://github.com/alexforencich/python-hpgl.git'
_gitname='python-hpgl'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  sed -i "s/'hpgl2svg/'python2-hpgl2svg/" setup.py
  sed -i "s/'hprtl2bmp/'python2-hprtl2bmp/" setup.py
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

