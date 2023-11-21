# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mpv-sponsorblock-git
pkgver=r53.29e7b75
pkgrel=1
pkgdesc="MPV script to skip sponsored segments of YouTube videos"
arch=('any')
url="https://github.com/po5/mpv_sponsorblock"
license=('GPL3')
groups=('mpv-plugins')
depends=('mpv' 'python')
makedepends=('git')
provides=('mpv-sponsorblock')
install=mpv-sponsorblock.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 sponsorblock.lua -t "$pkgdir/usr/lib/mpv/$pkgname/"
	install -Dm644 sponsorblock_shared/{main.lua,sponsorblock.py} -t "$pkgdir/usr/lib/mpv/$pkgname/sponsorblock_shared/"
	python -O -m compileall "$pkgdir/usr/lib/mpv/$pkgname/sponsorblock_shared/sponsorblock.py"
}
