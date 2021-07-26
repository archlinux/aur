# Maintainer: Alexander Bocken <alexander@bocken.org>
pkgname=threadwatcher
pkgver=r28.0ba9ae5
pkgrel=1
pkgdesc="Keep a list of 4chan threads to watch over and continually download media from"
arch=(any)
depends=(
	'jq'
	)
makedepends=('git')
optdepends=(
	'dmenu: display prompts if issues occur'
)
url="https://github.com/AlexBocken/threadwatcher"
license=('AGPL3')
source=('threadwatcher::git+https://github.com/AlexBocken/threadwatcher.git')
md5sums=('SKIP')
install="${pkgname}.install"
pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	#Update from old urlfile location to new
	THREADWATCHER_DIR_OLD=${XDG_DATA_HOME:-$HOME/.local/share}/4chan_watcher
	THREADWATCHER_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/threadwatcher
	[ -d "$THREADWATCHER_DIR_OLD" ] && mv -f "$THREADWATCHER_DIR_OLD" -T "$THREADWATCHER_DIR"
	#create urlfile location
	[ -d "$THREADWATCHER_DIR" ] || mkdir -p "$THREADWATCHER_DIR"
	cd "$srcdir/$pkgname"
	install -Dm755 threadwatcher $pkgdir/usr/bin/threadwatcher
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
