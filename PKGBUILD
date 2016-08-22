# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=libarnetwork-git
pkgver=r312.ae81092
pkgrel=2
pkgdesc="ARSDK Network Control Library"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(libarsal-git libarnetworkal-git)
optdepends=()
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('libarnetwork::git+https://github.com/Parrot-Developers/libARNetwork'
        'libarnetwork-Makefile'
        'Config-linux-config.h'
        'LICENSE')
sha256sums=('SKIP'
            '091f47636619a3d17318cd947823bc8e3b579c1c1cf043aac70c45969ceedbe9'
            '5956b54ef47ad26df51991a4aa7002abdcb524a51b455d040f55b4d11a4f44a7'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/libarnetwork"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp "$srcdir/libarnetwork-Makefile" "$srcdir/libarnetwork/Makefile"
	cp "$srcdir/Config-linux-config.h" "$srcdir/libarnetwork/Includes/config.h"
}

build() {
	cd "$srcdir/libarnetwork"
	make
}

package() {
	# Install headers
	mkdir -p "$pkgdir/usr/include/libARNetwork"
	cp "$srcdir/libarnetwork/Includes/libARNetwork/ARNetwork.h" "$pkgdir/usr/include/libARNetwork/"
	cp "$srcdir/libarnetwork/Includes/libARNetwork/ARNETWORK_Error.h" "$pkgdir/usr/include/libARNetwork/"
	cp "$srcdir/libarnetwork/Includes/libARNetwork/ARNETWORK_IOBufferParam.h" "$pkgdir/usr/include/libARNetwork/"
	cp "$srcdir/libarnetwork/Includes/libARNetwork/ARNETWORK_Manager.h" "$pkgdir/usr/include/libARNetwork/"

	# Install lib
	mkdir -p "$pkgdir/usr/lib"
	cp "$srcdir/libarnetwork/libarnetwork.so" "$pkgdir/usr/lib/"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
