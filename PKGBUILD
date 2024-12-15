# Maintainer: Archie Meng <archiemeng@protonmail.com>
pkgname=plasma-bigscreen-git
pkgver=r982.7f70dd7
pkgrel=1
pkgdesc="A big launcher giving you easy access to any installed apps and skills."
arch=('any')
url="https://plasma-bigscreen.org/"
license=('GPL2')
groups=()
depends=('kdeconnect' 
	'plasma-nm' 
	'plasma-pa' 
	'plasma-nano')

makedepends=('cmake' 'extra-cmake-modules' 'git') 
optdepends=('libcec: add USB-CEC support in order to be controlled by TV remotes'
            'plasma-remotecontrollers: add setting tab for remote controllers')
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
