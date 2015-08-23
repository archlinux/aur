# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=whatis
pkgname=whatis-git
pkgver=r74.5bd5816
pkgrel=1
pkgdesc="Terminal dictionary"
arch=('any')
url="https://github.com/SethDusek/whatis"
license=('BSD')
depends=('python2' 'python2-wget' 'python2-wordnik')
makedepends=('git')
source=('git://github.com/SethDusek/whatis.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_pkgname"
  sed -i -e 's/env pypy/python2/' whatis.py
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 whatis.py "${pkgdir}/usr/bin/whatis"
  install -Dm644 LICENSE "${pkgdir}/usr/share/doc/whatis/LICENSE"
}
