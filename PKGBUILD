# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=xkeycheck-git
pkgver=1.0.r11.971c504
pkgrel=1
epoch=
pkgdesc="Small X utility for checking if a key is pressed"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/randoragon/xkeycheck"
license=('MIT')
depends=(libx11)
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')
provides=('xkeycheck')

pkgver() {
    cd xkeycheck
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd xkeycheck
	make
}

package() {
	cd xkeycheck
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

