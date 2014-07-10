# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Corey Mwamba <contact.me@coreymwamba.co.uk>

pkgname=jwmtools-git
pkgver=r75.4689c0b
pkgrel=1
pkgdesc="Various tools for jwm window manager."
epoch=1
arch=('i686' 'x86_64')
url="https://github.com/kostelnik/jwmtools"
license=('GPL')
provides=('jwmtools')
conflicts=('jwmtools')
depends=('libglade' 'libxss')
makedepends=('git')
source=("$pkgname::git+https://github.com/kostelnik/jwmtools.git"
	build.patch)
md5sums=('SKIP'
         '010273979c95da69f3fcf5a35fe06cb4')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  patch -Np1 -b -z .orig -i ../build.patch
}


build() {
  cd $pkgname
  make PREFIX=/usr clean all
}

package() {
  cd $pkgname
  make PREFIX="$pkgdir/usr" install
}
