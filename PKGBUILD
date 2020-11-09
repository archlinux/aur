# Maintainer: Shailesh Aanand <anaandshailu@gmail.com>
pkgname=suto
pkgver=1.3.3
pkgrel=2
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
sha256sums=('06832a4a521dc0871f877752af4e04effc8d1b6ee74eb9f651deaf43aab675f9')

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
