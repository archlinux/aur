# Maintainer: Your Name <aur@passcod.name>
pkgname=sirikali-git
pkgver=1.99.999
pkgrel=2
pkgdesc="A Qt/C++ GUI front end to cryfs, gocryptfs, securefs and encfs"
arch=('i686' 'x86_64')
url="https://mhogomchungu.github.io/sirikali/"
license=('GPL')
makedepends=('git' 'qt5-base' 'cmake' 'libpwquality' 'libgcrypt' 'libsecret' 'lxqt_wallet')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('sirikali::git+https://github.com/mhogomchungu/sirikali.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	cmake \
	  -DCMAKE_BUILD_TYPE=RELEASE \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DINTERNAL_LXQT_WALLET=false \
	  -DNOKDESUPPORT=false \
	  -DNOSECRETSUPPORT=false \
	  -DQT5=true \
	  . ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
