# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=surf-randoragon-git
pkgver=1.0.r588.31e49bf
pkgrel=1
epoch=
pkgdesc="Randoragon's build of the suckless surf web browser"
arch=('x86_64')
url="https://github.com/randoragon/surf"
license=('MIT')
depends=(libx11 webkit2gtk xorg-xprop)
makedepends=(git)
optdepends=('dmenu')
source=("git+$url")
md5sums=('SKIP')
provides=('surf')
conflicts=('surf')

pkgver() {
    cd surf
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd surf
	make
}

package() {
	cd surf
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

