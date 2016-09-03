# Maintainer: alive4ever <alive4ever at live.com>
# Contributor: Earnest
pkgname=opendoas-git
pkgver=0.3.2.r9.6ed45e5
pkgrel=1
pkgdesc="Run commands as super user or another user, alternative to sudo"
arch=('x86_64' 'i686')
url="https://github.com/Duncaen/OpenDoas"
license=('custom:ISC')
depends=('pam')
provides=('opendoas')
makedepends=('git')
install=opendoas.install
source=("${pkgname%-git}::git+https://github.com/Duncaen/OpenDoas.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make V=s
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make V=s DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
