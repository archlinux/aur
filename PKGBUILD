# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=stc-git
pkgver=r336.353fbb9
pkgrel=1
pkgdesc="Stellar transaction compiler"
arch=(x86_64 i686 aarch64 armv71)
url="https://github.com/xdrpp/stc"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'go' 'go-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/xdrpp/stc.git'
	'git+https://github.com/xdrpp/goxdr.git')
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	ln -sf ../../goxdr cmd/
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
