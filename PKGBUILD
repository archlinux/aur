# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nick Saika <nicksaika@gmail.com>
pkgname=fstrm
pkgver=0.3.2
pkgrel=1
epoch=
pkgdesc="A C implementation of the Frame Streams data transport protocol"
arch=("i686" "x86_64")
url="https://github.com/farsightsec/fstrm"
license=('Apache')
groups=()
depends=("libevent")
makedepends=("pkg-config" "libevent")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/farsightsec/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("16112cda18aece363e32a04cd2265174b09944f3f3dcffa5c8312a293ec93737")
noextract=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
