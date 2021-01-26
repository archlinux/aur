# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=sent-randoragon-git
pkgver=1.0.r133.649cfa6
pkgrel=1
epoch=
pkgdesc="Randoragon's fork of the suckless sent presentation tool"
arch=('x86_64' 'i686' 'pentium4')
url=https://github.com/randoragon/sent
license=('ISC')
depends=(libx11 libxft fontconfig freetype2 farbfeld-git)
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd sent
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd sent
	make
}

package() {
	cd sent
    mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.MD"
}

