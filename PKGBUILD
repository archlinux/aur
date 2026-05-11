# Maintainer: Feds Farm <root@feds.farm>
pkgname=opendoas-patched
pkgver=6.8.3.r290.cb28954
pkgrel=1
pkgdesc='Doas with retries + patches'
arch=(x86_64 i686)
url='https://github.com/zeroarchroot/OpenDoas'
license=(custom:ISC)
depends=(pam)
provides=(opendoas)
conflicts=(opendoas)
makedepends=(git)
install=opendoas-patched.install
source=(
	'opendoas::git+https://github.com/zeroarchroot/OpenDoas.git'
)
sha256sums=(SKIP)

pkgver() {
	cd opendoas
	git describe --long --tags | sed 's,^v,,; s|-\(.*\)-g|.r\1.g|'
}

build() {
	cd opendoas
	./configure --prefix=/usr --with-timestamp
	make
}

package() {
	cd opendoas
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/opendoas-git/LICENSE
}
