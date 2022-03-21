# Maintainer: Kai Muenz <kai+archlinux@muenz.net>

_pkgname=odr-dabmod
pkgname=$_pkgname-git
pkgver=2.5.0.r0.g93e5171
pkgrel=1
pkgdesc="Opendigitalradio DAB modulator"
arch=('x86_64' 'i686' 'armv7h' 'aarch64') 
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
groups=()
depends=('fftw' 'zeromq' 'boost-libs' 'libuhd' 'limesuite' 'bladerf')
makedepends=('git' 'boost')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	./bootstrap.sh
}

build() {
	cd "$_pkgname"
	./configure --prefix=/usr --enable-limesdr --enable-bladerf
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
