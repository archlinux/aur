# Maintainer: Chloe Fontenot <foley2431@gmail.com>
_name=gambal
pkgname=$_name-git
pkgver=1.4.r0.ge0b2d3d
pkgrel=1
pkgdesc="A tiny graphical tool to monitor Network, CPU and Memory in linux"
arch=("any")
url="https://github.com/ashtum/gambal"
license=('GPL-2.0')
depends=("xorg-fonts-misc" "libx11")
makedepends=("cmake")
provides=("gambal")
source=("git+$url.git")
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_name"
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/$_name/build"
	make DESTDIR="$pkgdir/" install
}
