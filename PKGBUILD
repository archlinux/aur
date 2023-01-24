# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=libcerror-git
_pkg="${pkgname%-git}"
pkgver=20220101.r9.ga8e7608
pkgrel=1
pkgdesc='Library for cross-platform C error functions'
arch=('x86_64')
url='https://github.com/libyal/libcerror'
license=('LGPL3' 'GPL3')
provides=("$_pkg")
conflicts=("$_pkg")
depends=('glibc')
makedepends=('git')
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$_pkg"
	./synclibs.sh
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc
	make
}

package() {
	cd "$_pkg"
	make DESTDIR="$pkgdir/" install
}
