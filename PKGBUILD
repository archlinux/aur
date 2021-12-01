# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: McLenin <mclenin at gooogles email>

pkgname=purple-facebook-git
_gitname="purple-facebook"
pkgrel=1
pkgver=0.9.6.r8.g1a6711f
pkgdesc='Facebook protocol plugin for libpurple'
url="https://github.com/dequis/purple-facebook/"
arch=('i686' 'x86_64')
depends=(libpurple json-glib)
makedepends=(mercurial git)
license=('GPL2')
provides=('purple-facebook')
conflicts=('purple-facebook')
source=('purple-facebook::git+https://github.com/dequis/purple-facebook')
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  msg2 "This will take a bit as it needs to download more code"
  cd "$_gitname"
  ./autogen.sh
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
