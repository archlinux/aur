# Maintainer: Layne Bernardo <lmbernar (at) uark (dot) edu>
pkgname='labelmanager-git'
pkgver=2
pkgrel=1
pkgdesc="Simple barcode printing interface for Zebra printers using LPR"
arch=('x86_64')
url="https://github.com/LMBernardo/LabelManager"
license=('Apache-2.0')
depends=('qt5-base' 'qt5-websockets' 'cups')
makedepends=('git')
source=('git+https://github.com/LMBernardo/labelmanager.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
}
