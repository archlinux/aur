# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=vimpc-git
pkgver=0.09.1.r115.gc518610
pkgrel=1
pkgdesc="Vi/vim inspired client for Music Player Daemon (MPD)"
arch=('x86_64')
url="https://github.com/boysetsfrog/vimpc"
license=('GPL3')
#makedepends=('git')
makedepends=('boost' 'git')
depends=('libmpdclient' 'ncurses' 'pcre' 'taglib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}

