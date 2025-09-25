# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-bigscreen-git
pkgver=5.26.90.r555.g6c442f7
pkgrel=1
pkgdesc="A big launcher giving you easy access to any installed apps and skills"
arch=('any')
url="https://plasma-bigscreen.org/"
license=('GPL2')
groups=()
depends=('kdeconnect-git' 
        'plasma-nm-git' 
        'plasma-pa-git' 
        'plasma-nano-git'
	'bluez-qt-git')
makedepends=('cmake' 'extra-cmake-modules-git' 'git') 
optdepends=('libcec: add USB-CEC support in order to be controlled by TV remotes'
            'plasma-remotecontrollers-git: add support for remote controllers')
conflicts=('plasma-bigscreen')
source=('git+https://invent.kde.org/plasma/plasma-bigscreen.git')
noextract=()
md5sums=('SKIP')

pkgver() {
        cd "plasma-bigscreen"
        git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "plasma-bigscreen"
        cmake -B build \
              -DCMAKE_INSTALL_PREFIX="/usr" \
              -DCMAKE_BUILD_TYPE=Release 

	cmake --build build --target all
}

package() {
        cmake --install "plasma-bigscreen/build" --prefix "$pkgdir/usr"
}
