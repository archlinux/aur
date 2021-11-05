pkgname=rtl-wmbus-git
pkgver=r50.d2be82c
pkgrel=1
pkgdesc="Software defined receiver for wireless M-Bus with RTL-SDR"
arch=('i686' 'x86_64')
url=""
license=('BSD')
groups=()
depends=()
makedepends=('git' 'gcc' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('rtl-wmbus::git+https://github.com/xaelsouth/rtl-wmbus.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make release 'CFLAGS=-Iinclude -std=gnu99'
}

package() {
	cd "$srcdir/${pkgname%-git}"
        install -D build/rtl_wmbus "$pkgdir/usr/bin/rtl_wmbus"
}
