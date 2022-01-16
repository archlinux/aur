# Maintainer: Javier Ribal del Río <javierribal@gmail.com>
pkgname='quit-git'
pkgver=r130.4c081b8
pkgrel=1
pkgdesc="Application for Linux terminal to shutdown, reboot or suspend the computer. You can also set a timed shutdown or a timed reboot."
arch=('x86_64')
url="https://github.com/JavierRibaldelRio/quit.git"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git')
provides=('quit')
source=("quit-git::git://github.com/JavierRibaldelRio/quit.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$pkgname"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/quit/LICENSE.md"
	install -Dm64 README.md "${pkgdir}/usr/share/doc/quit/README.md"
}
