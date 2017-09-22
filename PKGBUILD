# Maintainer: Nick Shvelidze <captain@pirrate.me>
pkgname=rust-i586-git
pkgver=1.0.0.beta.r27179.g35edf7d8cb
pkgrel=1
pkgdesc="Rust for i586 machines without SSE2 (needs to be built on newer machines)"
url="https://github.com/rust-lang/rust"
arch=(i686 x86_64)
license=('MIT')
depends=(llvm-libs gcc-libs)
makedepends=(python git)
provides=(rust)
conflicts=(rustup)
source=("$pkgname::git://github.com/rust-lang/rust.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	./configure --target=i586-unknown-linux-gnu --host=i586-unknown-linux-gnu --disable-jemalloc --prefix=/usr
	python x.py build
}

package() {
	cd "$pkgname"
	python x.py dist
	DESTDIR="$pkgdir/" python x.py install
}
