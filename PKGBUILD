# Maintainer: Ivy Foster <code@escondida.tk>
# Contributor: alive4ever <alive4ever at live.com>
# Contributor: Earnest
pkgname=opendoas-git
pkgver=6.0.r56.g8b2a776
pkgrel=1
pkgdesc='Run commands as super user or another user'
arch=(x86_64 i686)
url='https://github.com/Duncaen/OpenDoas'
license=(custom:ISC)
depends=(pam)
provides=(opendoas)
conflicts=(opendoas)
makedepends=(git)
install=opendoas.install
source=(
	'opendoas::git+https://github.com/Duncaen/OpenDoas.git'
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
