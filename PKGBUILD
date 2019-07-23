# Maintainer: Jack Random, <jack(at)random(dot)to>
# previous: csllbr; Popsch <popsch@gmx.net>
# Thanks to the maintainers and contributors of the mu binary package

pkgname=mu-git
pkgver=1.3.3.1.gb7cda29b
pkgrel=1
pkgdesc="mu and mu4e from git"
arch=('i686' 'x86_64')
url="http://www.djcbsoftware.nl/code/mu"
depends=('xapian-core' 'guile' 'gmime3')
makedepends=('git')
optdepends=('emacs: mu4e support')
license=('GPL')
provides=('mu')
conflicts=('mu')
source=('git+https://github.com/djcb/mu.git')
md5sums=('SKIP')

pkgver() {
  cd mu
  printf "%s" "$(git describe --tags | tr - .)"
}

prepare() {
  cd mu
  ./autogen.sh
}

build() {
  cd mu
  ./configure --prefix=/usr --disable-webkit --disable-gtk --enable-mu4e --enable-guile --enable-shared
}

package() {
  cd mu
  make DESTDIR="$pkgdir" install
}
