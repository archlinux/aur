pkgname=titanim-mikalair-git
pkgver=2.1.0
pkgrel=1
pkgdesc="VK-based messenger"
arch=('i686' 'x86_64')
url="https://github.com/MikalaiR/TitanIM"
license=('GPL')
groups=('im')
depends=('qt5-base' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-webengine' 'aseman-qt-tools-git')
source=("git+https://github.com/MikalaiR/TitanIM.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/TitanIM"
	echo $(egrep -o "\"(.*)\"$" "version.h" | cut -d \" -f2).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/TitanIM"
	qmake
	make

}

package() {
        cd "$srcdir/TitanIM"
        make DESTDIR="$pkgdir/" INSTALL_ROOT="$pkgdir/" install
	install -Dm644 "TitanIM.desktop" "$pkgdir/usr/share/applications/TitanIM.desktop"
	install -Dm644 "TitanIM64.png" "$pkgdir/usr/share/pixmaps/TitanIM64.png"
}