# Maintainer: Weegee <weegee at devzero dot info> 

pkgname=qlivestreamer-git
pkgver=20131007
pkgrel=1
pkgdesc="qLiveStreamer is a small Qt/C++ frontend for Livestreamer, inspired by gLiveStreamer."
arch=('i686' 'x86_64')
url="https://github.com/Hyperz/qLiveStreamer"
license=('GPL2')
depends=('qt4' 'livestreamer')
makedepends=('git')
source=('git+https://github.com/Hyperz/qLiveStreamer.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

_gitname=qLiveStreamer

pkgver() {
	cd "$_gitname"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
	cd "$_gitname"
  qmake-qt4 PREFIX=/usr
	make
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
}