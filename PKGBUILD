# Maintainer: Igor Krasnyukov <imkrasnyukov@gmail.com>

pkgname=tkgate-git
pkgver="r25.856c405"
pkgrel=1
pkgdesc="An event driven digital circuit simulator with a tcl/tk-based graphical editor"
arch=('i686' 'x86_64')
url="https://github.com/bnoordhuis/tkgate"
license=('GPL')
makedepends=('git')
depends=('tk' 'tcl' 'libx11' 'bash' 'glibc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
