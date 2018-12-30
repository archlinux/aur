# Maintainer: LambdAurora <aurora42lambda@gmail.com>
pkgname=lambdacommon
pkgver=1.9.9
pkgrel=1
pkgdesc="A library written in C++ with common features."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://aperlambda.github.io/libraries/lambdacommon/"
license=('MIT')
makedepends=('cmake')
conflicts=('lambdacommon-git')
options=()
install=
source=("https://github.com/AperLambda/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	git clone https://github.com/AperLambda/LambdaCMakeModules.git cmake
	cmake .\
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build .
}

check() {
	cd "$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$pkgname-$pkgver"
	# Install LICENSE in /usr/share/licenses is now useless because it's now included in install target in make.
	#install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make DESTDIR="$pkgdir/" install
}
