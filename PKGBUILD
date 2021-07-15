# Maintainer: Salvaje <keystroke33@gmail.com>
pkgname=redpaper-git
pkgver=0.2.1.r14.166fbee
pkgrel=2
pkgdesc="Wallpaper downloader and setter that fetches from Reddit"
arch=('any')
url="https://github.com/keystroke3/redpaper"
license=('GPLv3+')
depends=('python>=3.7'
	'python-pillow'
	'python-praw'
	'python-gobject'
	'python-requests'
	'python-xdg'
	'xwallpaper'
)
makedepends=('git')
provides=('redpaper')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "0.2.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd $pkgname
	install -Dm755 src/* -t "$pkgdir/opt/$pkgname"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/redpaper.py" "$pkgdir/usr/bin/redpaper"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
