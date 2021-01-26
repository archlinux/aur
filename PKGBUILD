# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=dwm-randoragon-git
pkgver=6.2.r1797.db4cb74
pkgrel=1
epoch=
pkgdesc="Randoragon's build of the suckless dynamic window manager (dwm)"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/randoragon/dwm"
license=('MIT')
depends=(libx11 libxinerama libxcb libxrender libxft)
optdepends=('dwmblocks-randoragon-git: status bar')
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')
conflicts=('dwm')
provides=('dwm=6.2')

pkgver() {
    cd dwm
    printf "6.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dwm
	make
}

package() {
	cd dwm
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

