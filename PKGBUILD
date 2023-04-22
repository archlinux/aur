# Maintainer: Archie Meng <archiemeng@protonmail.com>
pkgname=plasma-bigscreen-git
pkgver=r411.7344fe3
pkgrel=1
pkgdesc="A big launcher giving you easy access to any installed apps and skills."
arch=('any')
url="https://plasma-bigscreen.org/"
license=('GPL2')
groups=()
depends=('kdeconnect' 
	'plasma-nm' 
	'plasma-pa' 
	'plasma-remotecontrollers'
	'plasma-nano'
    'plasma-settings'
    'qt5-virtualkeyboard')

makedepends=('cmake' 'extra-cmake-modules-git' 'git') 
optdepends=('libcec: add USB-CEC support in order to be controled by TV remotes'
            'mycroft-core: add voice control support') # Todo: test optional dependecies 
provides=('plasma-bigscreen')
conflicts=('plasma-bigscreen')
replaces=()
backup=()
options=()
install=
source=('git+https://invent.kde.org/plasma/plasma-bigscreen.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/plasma-bigscreen"
	printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/plasma-bigscreen"
	cmake -B build \
	      -DCMAKE_INSTALL_PREFIX="/usr" \
      	  -DCMAKE_BUILD_TYPE=Release 

    cmake --build build --target all
}

package() {
	cmake --install "$srcdir/plasma-bigscreen/build" --prefix "$pkgdir/usr"
}
