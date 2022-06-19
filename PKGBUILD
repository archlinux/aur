# Maintainer: ArtFox3  <artfox3@gmail.com>
pkgname="applet-window-buttons-git"
_pkgname="applet-window-buttons"
pkgver=0.11.1
pkgrel=1
epoch=
pkgdesc="This is a Plasma 5 applet that shows window buttons in your panels"
arch=('i686' 'x86_64')
url="https://github.com/psifidotos/applet-window-buttons"
license=('GPL')
groups=()
conflicts=('applet-window-buttons')
provides=('applet-window-buttons')
makedepends=(
  'gcc' 'git' 'extra-cmake-modules'
)
depends=(
  'plasma-framework'
  #'gettext'
  'kdecoration'
)
source=(
  "$pkgname::git+https://github.com/psifidotos/applet-window-buttons.git"
)
_sourcename="applet-window-buttons"
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
	#cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release -Wnodev ..
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -Wnodev ..
	make -j$(nproc)
}


package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
