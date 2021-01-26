# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=dmenu-randoragon-git
pkgver=5.0.r583.c6244a8
pkgrel=1
epoch=
pkgdesc="Randoragon's build of the suckless dynamic menu (dmenu)"
arch=('x86_64' 'i686')
url="https://github.com/randoragon/dmenu"
license=('MIT')
depends=(libx11 libxinerama libxft freetype2 fontconfig)
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')
conflicts=('dmenu')
provides=('dmenu=5.0')

pkgver() {
    cd dmenu
    printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dmenu
	make
}

package() {
	cd dmenu
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

