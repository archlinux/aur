# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis-git
pkgver=r822.9c513c3
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
arch=('any')
url="http://web-artanis.com/"
license=('GPL')
depends=('guile')
makedepends=('git')
provides=('artanis')
conflicts=('artanis')
install=$pkgname.install
source=("git+https://github.com/NalaGinrut/artanis.git#commit=9ad2f8ac780e5fee4dc5c7e61688817b9f9237f2")
_gitname="artanis"
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
LANG=C
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
