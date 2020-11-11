# Maintainer: Shailesh Aanand <anaandshailu@gmail.com>
pkgname=suto
pkgver=v1.4.0
pkgrel=3
pkgdesc="suto is a Linux PAM authenticator which uses Android phone biometrics to verify user credentials for granting super-user access."
arch=('x86_64')
url='https://github.com/anjanik012/suto'
license=('GPL3')
groups=()
depends=('pam' 'boost-libs')
makedepends=('cmake' 'boost')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://github.com/anjanik012/suto/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5781a5a5d2dcf8b958a7c25e1e6d37504b95e32f32f1b4ea3dc03099f9b580f6')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	cmake -B build \
		-DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
	make -C build -j$(nproc)
}

package() {
	install="suto.install"
	cd "$pkgname-$pkgver"
	make -C build DESTDIR="$pkgdir/" install
}
