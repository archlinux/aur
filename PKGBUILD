# Maintainer: Leandro Vital <leandro em lvital ponto com>
pkgname=inkaur-git
_pkgname=inkaur
pkgver=0.1.0.r6.g7b812cd
pkgrel=1
pkgdesc="A simple, lightweight, and fast AUR helper written in C (git version)"
arch=('x86_64')
url="https://github.com/lvitals/inkaur"
license=('MIT')
depends=('curl' 'pacman')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
