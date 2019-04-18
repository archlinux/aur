# Maintainer: Ultracoolguy <dummyd241 at gmaildotcom>
pkgname="switch-lan-play"
pkgver=git
pkgrel=1
epoch=0
pkgdesc="A program for connecting to fanmade Nintendo Switch servers--see url for more info"
arch=(any)
url="https://github.com/spacemeowx2/switch-lan-play"
license=('GPL3')
groups=()
depends=(libpcap)
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/spacemeowx2/switch-lan-play.git")
noextract=()
md5sums=('SKIP')
pkgver() {
  cd switch-lan-play

  git describe --tags | sed 's/-/.r/; s/-g/./'

}


prepare() {
	echo "Executing if"
	if [[ -d switch-lan-play ]];then
	  rm -rf switch-lan-play
	fi
	git clone $source
}

build()	{
	cd switch-lan-play
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}
package() {
	cd switch-lan-play/build
	make DESTDIR="$pkgdir/" install
}

