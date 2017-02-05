pkgname=cctools-git
pkgdesc="Apple cctools port for Linux"
pkgver=146
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/tpoechtrager/cctools-port"
license=("APSL")
depends=(llvm)
makedepends=(gcc-objc git)
provides=(x86_64-apple-darwin-binutils cctools)
conflicts=(x86_64-apple-darwin-binutils cctools)
source=("git+https://github.com/tpoechtrager/cctools-port.git")
md5sums=('SKIP')

pkgver() {
	cd cctools-port
	echo $(git rev-list --count HEAD)
}

build() {
	cd cctools-port/cctools
	./autogen.sh
	./configure \
		--prefix=/usr \
		--target=x86_64-apple-darwin \
		--with-llvm-config=/usr/bin/llvm-config \
		--libexecdir=/usr/lib
	make
}

package() {
	cd cctools-port/cctools
	make DESTDIR="$pkgdir" install
}
