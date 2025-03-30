# Maintainer:  Tomek Szczęsny <mctom at tlen in poland>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Ben Mazer <blm@groknil.org>
# Contributor: Mike Douglas <code_monkey@gooeylinux.org>

pkgname=gtypist-git
pkgver=2.10.1
pkgrel=4
pkgdesc="universal typing tutor"
arch=('x86_64')
url="http://www.gnu.org/software/gtypist/gtypist.html"
license=("GPL3")
depends=('ncurses' 'perl')
makedepends=('git' 'gengetopt' 'help2man')
conflicts=("gtypist")
provides=('gtypist=${pkgver}')
source=("git+https://git.savannah.gnu.org/git/gtypist.git"
	ncurses.patch)
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir"/gtypist
  patch -p1 <"$srcdir"/ncurses.patch
}

build() {
  cd "$srcdir"/gtypist
  #autoreconf
  ./autogen.sh --prefix=/usr
  #./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/gtypist
  make prefix="$pkgdir"/usr install
}

pkgver() {
  cd "gtypist"
  git describe --long --tags --abbrev=7 | sed 's/release.//'\
	  				| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
