# Maintainer: Layne Bernardo <lmbernar (at) uark (dot) edu>
pkgname='labelmanager-git'
pkgver=0.1
pkgrel=3
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
  	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
