# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Shailesh Aanand <anaandshailu@gmail.com>
pkgname=suto
pkgver=1.3.3
pkgrel=2
epoch=
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
install=
changelog=
source=("https://github.com/anjanik012/suto/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('06832a4a521dc0871f877752af4e04effc8d1b6ee74eb9f651deaf43aab675f9')
validpgpkeys=()

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
	cd "$pkgname-$pkgver"
	make -C build DESTDIR="$pkgdir/" install
}
