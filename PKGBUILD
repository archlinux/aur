
# Maintainer: Pixel Light <evan@tatarka.me>
pkgname=ponysay-rust-git
_pkgname=ponysay
pkgver=0.2.r0.gcacf653
pkgrel=1
pkgdesc="Bare-bones implementation of ponysay in rust"
arch=("any")
url="https://github.com/evant/ponysay-rust"
license=("GPL3" "FDL")
depends=()
makedepends=('rust' 'git')
provides=('ponysay')
conflicts=('ponysay')
source=("$_pkgname::git+https://github.com/evant/ponysay-rust.git")
sha256sums=('SKIP')

pkgver() {
  	cd "$_pkgname"
  	# cutting off 'v' prefix that presents in the git tag
  	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	make PREFIX="/usr"
}

check() {
	cd "$_pkgname"
	make check
}

package() {
	cd "$_pkgname"
	make install PREFIX="/usr" DESTDIR="$pkgdir"
}

