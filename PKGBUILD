_gitname=pam-MySQL
pkgname=pam_mysql-git
pkgver=b8ea8eb
pkgrel=1
pkgdesc="PAM module for mysql from github."
arch=('i686' 'x86_64')
url="https://github.com/NigelCunningham/pam-MySQL"
depends=('pam')
makedepends=('make' 'autoconf')
source=('git+https://github.com/NigelCunningham/pam-MySQL.git')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
  cd "$srcdir/$_gitname"
  autoreconf -f -i
  ./configure --prefix=/usr --disable-static
  make
}
package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
