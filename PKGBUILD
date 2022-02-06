# Maintainer: EndlessEden <eenov1988@gmail.com>
# Contributor: FabioLolix

_pkgname=odr-audioenc
pkgname=$_pkgname-git
pkgver=3.1.0.r0.gf932f86
pkgrel=1
pkgdesc="Opendigitalradio DAB and DAB+ encoder"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('Apache')
groups=('ODR')
depends=('zeromq' 'curl' 'vlc' 'gst-plugins-base-libs')
makedepends=('git')
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
	./bootstrap
}

build() {
	cd "$_pkgname"
	./configure --prefix=/usr --enable-alsa --enable-jack --enable-vlc --enable-gst
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
