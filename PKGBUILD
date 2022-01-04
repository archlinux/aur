# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=otpclient-git
pkgver=2.4.7.r2.gf930e38
pkgrel=1
pkgdesc="GTK+ v3 TOTP/HOTP client"
arch=('x86_64')
url="https://github.com/paolostivanin/OTPClient"
license=('GPL3')
depends=('gtk3' 'glib2' 'jansson' 'libgcrypt' 'libzip' 'libcotp' 'libpng' 'zbar')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=(
	'060C6B7D3869F148C4C4ACD43C9BE9B64EC1EA64'  ## Paolo Stivanin
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') ## GitHub

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$pkgname" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
