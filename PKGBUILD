# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis-git
pkgver=r862.c616685
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
arch=('any')
url="http://web-artanis.com/"
license=('GPL')
depends=('guile')
makedepends=('git')
provides=('artanis')
conflicts=('artanis')
source=("git+https://gitlab.com/NalaGinrut/artanis.git#commit=c616685a8df3c9dad32289aea14ad78c3f788de7")
md5sums=('SKIP')
options=('!makeflags')
_gitname="artanis"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
  make docs
}

check() {
  cd "$srcdir"/"$_gitname"
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
