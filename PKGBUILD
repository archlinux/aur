# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mit-scheme-git
pkgver=9.2.0.1492.g7ee7d63ee
pkgrel=1
pkgdesc="MIT/GNU Scheme from git"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/mit-scheme/"
license=('GPL')
depends=('mhash' 'libmcrypt' 'ncurses' 'libx11' 'postgresql-libs' 'termcap')
optdepends=('openssl: support for openssl')
makedepends=('git' 'mit-scheme')
provides=('mit-scheme')
conflicts=('mit-scheme')
source=("git+http://git.savannah.gnu.org/r/mit-scheme.git#commit=7ee7d63eeb320a9590165b2a067ada9992aa1393")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | tr - . | cut -c9-
}

build() {
  LANG=C
  cd ${pkgname%-git}/src
  ./Setup.sh
  ./configure --prefix=/usr --with-x --enable-native-code
  make
}

package() {
  cd ${pkgname%-git}/src
  make DESTDIR="$pkgdir/" install
}
