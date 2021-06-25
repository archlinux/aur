# Maintainer: Jashank Jeremy <arch-aur at jashankj dot space>

pkgname=libxo
pkgver=1.6.0
pkgrel=1
pkgdesc='a library for generating text, XML, JSON, and HTML output'
arch=('x86_64')
url='https://github.com/juniper/libxo'
license=('BSD')
groups=()
depends=()
makedepends=('git')
provides=('libxo')
conflicts=('libxo-git')
replaces=()
backup=()
options=()
install=
source=(
	"git+${url}.git#tag=${pkgver}"
	"patch-libxo__xo_syslog.c"
)
noextract=()
md5sums=('SKIP' '6a0431e5a69f2691836af7ef363f90de')

pkgver() {
	git -C "$srcdir/${pkgname%-git}" describe --tags
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch --forward --strip=1 --input="${srcdir}/patch-libxo__xo_syslog.c"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	sh ./bin/setup.sh
	sh ./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
