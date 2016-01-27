# Maintainer: Joshua Haase <hahj87@gmail.com>
pkgname=mmh-git
pkgver=0.2.r14.e9df3f1
pkgrel=1
pkgdesc="The Modern Mail Handler"
arch=(i686 x86_64)
url="http://marmaro.de/prog/mmh/"
license=('CUSTOM:BSD')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+http://git.marmaro.de/mmh")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed -e 's/^mmh-//' -e's/\([^-]*-\)g/r\1/;s/-/./g')"
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
	install -D COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
