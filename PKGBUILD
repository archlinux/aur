# Maintainer: Paulo Matos <pmatos@linki.tools>

pkgname='mbsync-git'
_pkgname='mbsync'
pkgver=912.95d18e2
pkgrel=1
pkgdesc="free (GPL) mailbox synchronization program"
arch=('i686' 'x86_64')
url="http://isync.sourceforge.net/"
license=('GPL')
depends=('openssl')
makedepends=('git' 'autoconf' 'automake')
provides=('mbsync')
source=("$_pkgname::git+https://git.code.sf.net/p/isync/isync.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd ${pkgname%-git}
  # Autogen
  ./autogen.sh
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
}