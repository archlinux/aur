# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=st-randoragon-git
pkgver=0.8.3.r1142.0a3606d
pkgrel=1
epoch=
pkgdesc="Randoragon's build of the suckless terminal (st)"
arch=('x86_64')
url="https://github.com/randoragon/st"
license=('MIT')
depends=(libx11 fontconfig freetype2 libxrender libxft-bgra)
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd st
    printf "0.8.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd st
	make
}

package() {
	cd st
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

