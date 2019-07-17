# Maintainer: Ultracoolguy <dummyd241 at gmaildotcom>
pkgname="switch-lan-play"
pkgver=v0.1.0.r36.787a27d
pkgrel=1.3
epoch=0
pkgdesc="A program for connecting to switch-lan-play servers-see url for more info"
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
source=("$pkgname::${url}.git")
noextract=()
md5sums=('SKIP')
pkgver() {
  cd switch-lan-play

  git describe --tags | sed 's/-/.r/; s/-g/./'

}


prepare() {
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

