# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

pkgname=wayclip-git
pkgver=0.1.r9.9bc59e2
pkgrel=1
pkgdesc='wayclip is a pair of command-line utilities: waycopy and waypaste, which allow access to the Wayland clipboard'
arch=('x86_64')
url='https://github.com/noocsharp/wayclip'
license=('ISC')
groups=('shironeko')
depends=('wlroots')
makedepends=('git' 'wayland') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('wayclip::git+https://github.com/noocsharp/wayclip.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
