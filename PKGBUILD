# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=nickvision-money
_pkgname=NickvisionMoney
pkgver=2022.10.0
pkgrel=2
pkgdesc="A personal finance manager"
arch=('x86_64')
url=https://github.com/nlogozzo/$_pkgname
license=('GPL3')
depends=('jsoncpp' 'libadwaita' 'sqlitecpp')
makedepends=('boost' 'cmake' 'meson')
source=($url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('25592a02546d40e3f29bb43eaf3c74bdca8ab01bb776ffbd4b3ba0f116e66f02')

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
