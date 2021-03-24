# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=python2-pynapi-git
pkgver=0.5.7.r0.gd9b3b4d
pkgrel=1
pkgdesc='python library (and cmd util) to download subtitles from various subtitle sites'
arch=(any)
url='https://github.com/jabbas/pynapi'
license=('GPL')
makedepends=(git python2-setuptools)
provides=(pynapi)
source=('git://github.com/jabbas/pynapi.git')
_gitname='pynapi'
md5sums=(SKIP)

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
build(){
  cd "$srcdir"/$_gitname
  python2 setup.py build
}
package(){
  cd "$srcdir"/$_gitname
  echo python setup.py install --skip-build -O1 --root="$pkgdir"
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
  install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

