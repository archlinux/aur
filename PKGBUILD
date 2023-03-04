# Maintainer: Davide Cioni <davide dot cioni dot 128 at gmail dot com>
pkgname="ifetch-git"
pkgver=r142.8118ca8
pkgrel=1
pkgdesc="A fetch tool to display network interface information"
arch=("x86_64")
url="https://github.com/deivshon/ifetch"
license=('MIT')
depends=("glibc")
makedepends=("git" "make")
checkdepends=()
optdepends=()
source=("$pkgname::git+https://github.com/deivshon/ifetch.git")
md5sums=("SKIP")
backup=('etc/ifetch/ifetchrc')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	DEST_DIR="$pkgdir" make install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
