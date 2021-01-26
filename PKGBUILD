# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=dwmblocks-randoragon-git
pkgver=1.0.r77.2d5688d
pkgrel=1
epoch=
pkgdesc="Randoragon's build of dwmblocks - a status bar for my build of dwm"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/randoragon/dwmblocks"
license=('MIT')
depends=(libx11)
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd dwmblocks
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dwmblocks
	make
}

package() {
	cd dwmblocks
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

