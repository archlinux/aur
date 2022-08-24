# Maintainer: Rishabh Das <rdas@tutanota.com>
pkgname='pathbins-git'
pkgver=v0.1.0.r0.g281a7cf
pkgrel=1
pkgdesc="A command-line utility which lists all executables inside directories specified by PATH variable"
arch=('x86_64')
url="https://github.com/metent/pathbins"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('pathbins')
conflicts=('pathbins')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd pathbins
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd pathbins
	make
}

package() {
	cd pathbins
	make DESTDIR="$pkgdir" install
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
