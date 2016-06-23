# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=coconut-lang-git
_name=coconut
pkgver=0.r1602.36f9240
pkgrel=1
pkgdesc="Simple, elegant, Pythonic functional programming."
arch=('any')
url="http://coconut-lang.org/"
license=('Apache')
depends=('python' 'python-pyparsing')
provides=('coconut-lang')
conflicts=('coconut-lang')
makedepends=('git')
source=('git://github.com/evhub/coconut.git')
md5sums=('SKIP')
 
pkgver() {
  cd "$srcdir/$_name"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_name"
  # hardcoded versions suck
  sed -i 's/"pyparsing==.*"/"pyparsing"/' setup.py
}

build() {
  cd "$srcdir/$_name"
  python setup.py build
}
 
package() {
  cd "$srcdir/$_name"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
