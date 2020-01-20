# Maintainer: yt-theme <13133528465@163.com>
# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=yt-popball-git
pkgver=1.0.r0.3d8d6b0
pkgrel=1
pkgdesc="A PopBall"
arch=(x86_64)
url="https://github.com/yt-theme/popBall"
license=('GPL3')
groups=()
depends=('qt5-base')
makedepends=('git')
provides=("yt-popball")
conflicts=("yt-popball")
replaces=()
backup=()
options=()
install=
source=('yt-popball::git+https://github.com/yt-theme/popBall.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/yt-popball"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/yt-popball"
	#patch -p1 -i "$srcdir/yt-popball.patch"
}

build() {
	cd "$srcdir/yt-popball"
	qmake popBall.pro
	make
}

check() {
	cd "$srcdir/yt-popball"
	make -k check
}

package() {
	cd "$srcdir/yt-popball"
		
	install -D -m755 popBall "$pkgdir/usr/bin/yt-popball"
	
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/yt-popball/LICENSE"
	install -D -m644 res/popBall.svg "$pkgdir/usr/share/pixmaps/popBall.svg"
	install -D -m644 res/yt-popball.desktop "$pkgdir/usr/share/applications/yt-popball.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/yt-popball/README.md"
}
