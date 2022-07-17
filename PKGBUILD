# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Contributor: Brandon Moller <mollerbw@gmail.com>
pkgname=passwordsafe-git
pkgver=r13263.98a688fb6
pkgrel=1
pkgdesc="Simple & Secure Password Management"
arch=('i686' 'x86_64')
url="https://pwsafe.org/"
license=('Artistic2.0')
depends=('wxwidgets-gtk3' 'qrencode' 'yubikey-personalization' 'xerces-c')
makedepends=('git' 'cmake' 'gtest' 'zip' 'libxt')
optdepends=('xvkbd: virtual-keyboard support')
conflicts=('passwordsafe-debian' 'passwordsafe' 'pwsafe')
source=("$pkgname::git+https://github.com/pwsafe/pwsafe.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	mkdir -p build && cd build
	
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$pkgname"/build
	
	DESTDIR="$pkgdir" make install
}

