# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mit-scheme-git
pkgver=9.2.0.1146.g8c4a14530
pkgrel=1
pkgdesc="MIT/GNU Scheme from git"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/mit-scheme/"
license=('GPL')
depends=('ncurses' 'libx11' 'postgresql-libs')
optdepends=('openssl: support for openssl')
makedepends=('git' 'mit-scheme')
provides=('mit-scheme')
conflicts=('mit-scheme')
source=("git+http://git.savannah.gnu.org/r/mit-scheme.git")
md5sums=('SKIP')
_gitname="mit-scheme"
options=('!makeflags')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g' | cut -c9-
}

build() {
  cd $_gitname/src
  ./Setup.sh
  ./configure --prefix=/usr --with-x --enable-native-code
  make
}

package() {
  cd $_gitname/src
  make DESTDIR="$pkgdir/" install
}
