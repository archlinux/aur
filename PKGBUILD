pkgname=qmenu_hud-git
pkgver=r20.06fcb36
pkgrel=1
pkgdesc="a small menu search program, similar to Unity's HUD"
arch=('i686' 'x86_64')
url="https://github.com/tetzank/qmenu_hud/"
license=('GPL2')
makedepends=('git' 'cmake')
depends=('qt5-base' 'libdbusmenu-qt5' 'libx11' 'dmenu')
optdepends=('appmenu-qt4: support for qt4 applications'
            'appmenu-gtk-module: support for gtk applications')
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
