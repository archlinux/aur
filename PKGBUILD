# Maintainer: Ultracoolguy <dummyd241 at gmaildotcom>
pkgname="switch-lan-play-git"
pkgver=v0.2.1.r23.g200e767
pkgrel=1
epoch=0
pkgdesc="A program for connecting to switch-lan-play servers-see url for more info"
arch=(any)
url="https://github.com/spacemeowx2/switch-lan-play"
license=('GPL3')
groups=()
depends=("libpcap")
makedepends=("cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=("switch-lan-play")
backup=()
options=()
install=
changelog=
source=("$pkgname::git+${url}")
noextract=()
md5sums=('SKIP')

#Taken from this forum https://bbs.archlinux.org/viewtopic.php?id=230826
 pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
	cd $pkgname
	git submodule init
	git submodule update --init --recursive
}



build()	{
	cd $pkgname
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}
package() {
	cd $pkgname/build
	make DESTDIR="$pkgdir/" install
}

