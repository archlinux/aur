# Maintainer: Brett Dutro <brett.dutro@gmail.com>
pkgname=ashuffle-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r64.aab5d80
pkgrel=2
pkgdesc=""
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/joshkunz/ashuffle"
license=('MIT')
depends=('libmpdclient')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('ashuffle::git+https://github.com/joshkunz/ashuffle')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/bin"
	make prefix="$pkgdir/usr" install
}
