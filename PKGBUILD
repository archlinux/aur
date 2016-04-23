pkgname=qmenu_hud-git
pkgver=r18.b441c38
pkgrel=1
pkgdesc="a small menu search program, similar to Unity's HUD"
arch=('i686' 'x86_64')
url="https://github.com/tetzank/qmenu_hud/"
license=('GPL2')
makedepends=('git' 'cmake')
depends=('qt4' 'libdbusmenu-qt' 'libx11' 'dmenu')
optdepends=('appmenu-qt: support for qt4 applications'
            'appmenu-qt5-bzr: support for qt5 applications'
			'unity-gtk-module-standalone-bzr: support for gtk applications')
#source=(https://github.com/tetzank/qmenu_hud/archive/${pkgver}.tar.gz)
#md5sums=('256c586a67d7e0bfde5bec47ef599469')
source=("${pkgname%-git}::git+https://github.com/tetzank/qmenu_hud.git")
md5sums=('SKIP')

pkgver(){
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
    cd "$srcdir/${pkgname%-git}"

	make DESTDIR="$pkgdir" install
}
