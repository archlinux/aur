# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=jackstrobe-git
pkgver=r8.87dc213
pkgrel=1
pkgdesc="Simple strobe tuner using JACK and Qt 5"
arch=('x86_64')
url="https://github.com/jessecrossen/jackstrobe"
license=('Unlicense')
depends=('jack' 'qt5-base')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/jessecrossen/jackstrobe')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/project"
	qmake-qt5 PREFIX=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/project"
	install -D jackstrobe "$pkgdir/usr/bin/jackstrobe"
}
