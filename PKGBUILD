# Maintainer: McLenin <mclenin at gooogles email>

pkgname=purple-facebook-git
_gitname="purple-facebook"
pkgrel=1
pkgver=v0.9.5.9ff9acf9fa14.r8.g805a87d 
pkgdesc="A purple (pidgin, finch, ...) plugin for Facebook chat, based on the new Facebook 
Messenger protocol"
url="https://github.com/dequis/purple-facebook/"
arch=('i686' 'x86_64')
license=('GPL2')
provides=('purple-facebook')
conflicts=('purple-facebook')
source=('purple-facebook::git+https://github.com/jgeboski/purple-facebook'
)
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


depends=(
  libpurple json-glib zlib
)
makedepends=(mercurial autoconf git)


build() {
  msg2 "This will take a bit as it needs to download more code"
  cd "$_gitname"
  ./autogen.sh
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}
