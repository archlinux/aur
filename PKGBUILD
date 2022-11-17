# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=nickvision-money
_pkgname=NickvisionMoney
pkgver=2022.11.0
pkgrel=1
pkgdesc="A personal finance manager"
arch=('x86_64')
url=https://github.com/nlogozzo/$_pkgname
license=('GPL3')
depends=('jsoncpp' 'libadwaita' 'sqlitecpp')
makedepends=('boost' 'cmake' 'meson')
source=($url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('ec816b35eab7547356cf68f12a25822a0535eb1b81d64f64f374367b2fb45f95')

prepare() {
	#fix conflict with geary
	cd $_pkgname-$pkgver
	sed -i 's/edit-symbolic/nick-edit-symbolic/' src/meson.build src/ui/controls/transactionrow.cpp
	mv src/resources/edit-symbolic.svg src/resources/nick-edit-symbolic.svg
}

build() {
	arch-meson $_pkgname-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
