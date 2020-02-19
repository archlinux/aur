# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Martens <aur@defaultschuldiger.de>
pkgname=lib1541img
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Library (incl. headers) for handling Commodore 1541 disk images."
arch=('i686' 'x86_64')
url="https://github.com/excess-c64/${pkgname}"
license=('custom:BSD 2-Clause "Simplified" License')
groups=()
depends=('glibc')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/excess-c64/${pkgname}.git#tag=v${pkgver}")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git submodule update --init
}

build() {
	cd "$pkgname"
	make -j4 strip
}

package() {
	cd "$pkgname"
	make prefix="/usr/" DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
