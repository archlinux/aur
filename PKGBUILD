# Maintainer: éclairevoyant

_pkgname=autorandr
pkgname="$_pkgname-git"
pkgver=1.13.3.r8.g65a2b31
pkgrel=1
pkgdesc="Auto-detect connected display hardware and load appropiate X11 setup using xrandr"
arch=(any)
url="https://github.com/phillipberndt/$_pkgname"
license=(GPL3)
depends=(python xorg-xrandr)
makedepends=(desktop-file-utils git)
optdepends=(
	"pm-utils: For changing autorandr profile on thaw/resume"
	"python2: For using autorandr_monitor"
	"xorg-xdpyinfo: For detecting the primary XRandR output"
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -vDm644 contrib/zsh_completion/_$_pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
	install -vDm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}
