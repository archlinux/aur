# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=nq-git
pkgver=0.3.1.r0.gc09c3a7
pkgrel=1
pkgdesc="Unix command line queue utility"
arch=('x86_64') 
url="https://github.com/chneukirchen/nq"
license=('custom')
depends=('bash')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make all
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="/usr/" DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
