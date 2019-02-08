# Maintainer: Jorge Javier Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>; csllbr; Popsch <popsch@gmx.net>

pkgname=mu-ng-git
pkgver=v1.0.154.g156c4211
pkgrel=1
pkgdesc="Maildir indexer/searcher and Emacs client (mu4e)"
arch=("x86_64")
url="http://www.djcbsoftware.nl/code/mu"
license=("GPL")
provides=('mu')
conflicts=('mu' 'mu-git')
depends=("gmime" "xapian-core" "guile2.0")
makedepends=("emacs" "git")
optdepends=("guile: guile support"
	    "emacs: mu4e support")
source=("git+https://github.com/djcb/mu.git")
md5sums=('SKIP')

pkgver() {
  cd mu
  printf "%s" "$(git describe --tags|sed 's+-+.+g')"
}

build() {
  cd mu
  autoreconf -i
  ./configure --prefix=/usr --disable-webkit --disable-gtk --enable-mu4e --enable-guile
}

package() {
  cd mu
  make DESTDIR="$pkgdir" install
}
