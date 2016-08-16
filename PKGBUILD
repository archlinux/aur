# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=libarsal-git
pkgver=r313.0ba6cba
pkgrel=1
pkgdesc="ARSDK Software Abstraction Layer"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(glibc)
optdepends=()
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('libarsal::git+https://github.com/Parrot-Developers/libARSAL'
        'libarsal-Makefile'
        'LICENSE')
sha256sums=('SKIP'
            '69ec1d1d2c7c95bc0f9e1645c5afab9cd8f81e4a6b9c6052a16e871b95e3efc3'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/libarsal"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Copy Makefile
	cp libarsal-Makefile "$srcdir/libarsal/Makefile"
}

build() {
	cd "$srcdir/libarsal"
	make
}

package() {
	# Copy headers
	mkdir -p "$pkgdir/usr/include/libARSAL"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Endianness.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Error.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Ftw.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_MD5_Manager.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Mutex.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Print.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Sem.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Singleton.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Socket.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Thread.h" "$pkgdir/usr/include/libARSAL/"
	cp "$srcdir/libarsal/Includes/libARSAL/ARSAL_Time.h" "$pkgdir/usr/include/libARSAL/"

	# Copy lib
	mkdir -p "$pkgdir/usr/lib"
	cp "$srcdir/libarsal/libarsal.so" "$pkgdir/usr/lib/"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
