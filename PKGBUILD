# Maintainer: Michele Bovo <mbovo@gmx.com>

pkgname='twik-git'
pkgver=r42.d3403e7
pkgrel=1
pkgdesc="A commandline hash-based password generator"
url="http://gustavomondron.github.io/twik/"
arch=('any')
license=('GPL')
depends=('python2')
makedepends=('git' 'python2-setuptools')
source=('git+https://github.com/coxande/Twik')
sha512sums=('SKIP')

pkgver() {
  cd Twik
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd Twik/twik
  sed -i 's#usr/bin/python#usr/bin/python2#' twik.py
  sed -i 's#usr/bin/python#usr/bin/python2#' run.py
  sed -i 's#usr/bin/python#usr/bin/python2#' util.py
  
}

package() {
  cd Twik
  python2 setup.py install --optimize=1 --root="$pkgdir/"
}
