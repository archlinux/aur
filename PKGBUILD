# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Contributor: Vincent Bernardoff <vb AT luminar.eu.org>

pkgname=mmc-utils-git
pkgver=r88.a1b233c
pkgrel=1
epoch=1
pkgdesc="Userspace tools for MMC/SD devices"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git"
license=('GPL')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" prefix=/usr install
	install -D man/mmc.1 "$pkgdir/usr/share/man/man1/mmc.1"
}
