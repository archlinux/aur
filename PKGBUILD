# Maintainer: katt <magunasu.b97@gmail.com>

_pkgname=mpv-webm
pkgname=$_pkgname-git
pkgver=r81.777218d
pkgrel=1
pkgdesc="Simple WebM maker for mpv"
arch=('any')
url="https://github.com/ekisu/mpv-webm"
license=('MIT')
depends=('mpv')
makedepends=('moonscript')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	install -Dm644 "$_pkgname/build/webm.lua" -t "$pkgdir/usr/lib/mpv"
	install -Dm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
