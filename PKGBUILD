# Maintainer: Rich Daley <rich@fishpercolator.co.uk>
pkgname=workrave-next-gtk3-git
pkgver=v1_10_16.r644.7ede0462
pkgrel=1
pkgdesc="a tool to help RSI (bleeding-edge gtk3 including mutter/wayland support)"
arch=('i686' 'x86_64')
url="https://github.com/rcaelers/workrave/tree/next"
license=('GPL2')
groups=()
depends=('gtkmm3' 'gstreamer' 'libxss' 'boost-libs' 'libpulse' 'gtk2')
makedepends=('git' 'cmake' 'boost')
optdepends=('mutter: wayland/mutter support')
conflicts=('workrave')
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/rcaelers/workrave.git#branch=next")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname}/build"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_UI=Gtk+3 ..
	make
}

package() {
  cd "$srcdir/${pkgname}/build"
	make DESTDIR="$pkgdir/" install
}
