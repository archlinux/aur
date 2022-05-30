# Maintainer: ArtFox3  <artfox3@gmail.com>
pkgname="applet-window-appmenu-git"
pkgver=v0.8.0
pkgrel=1
epoch=
pkgdesc="This is a Plasma 5 applet that shows the current window appmenu in your panels. This plasmoid is coming from Latte land but it can also support Plasma panels."
arch=('i686' 'x86_64')
url="https://github.com/psifidotos/applet-window-appmenu.git"
license=('GPL')
groups=()
makedepends=('gcc' 'git' 'extra-cmake-modules')
depends=('plasma-framework' 'kdecoration' 'plasma-workspace')
conflicts=('plasma5-applets-window-appmenu' 'plasma5-applets-window-appmenu-git')
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()
#pkgver() {
#  cd "$pkgname"
#  ( set -o pipefail
#    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
#    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#  )
#}

build() {
	cd "$pkgname"
	if ! [ -a build ] ; then
	    mkdir build
	fi
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release  .. -Wnodev
	make -j$(nproc)
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
