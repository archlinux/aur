# Maintainer: Yufan You <ouuansteve at gmail.com>

pkgname=uoj-data-converter-git
pkgver=0.4.2.r2.g7acb800
pkgrel=1
pkgdesc='将各种各样格式的数据转换为 UOJ 的格式'
arch=('x86_64')
url='https://github.com/ouuan/uoj-data-converter'
license=('Apache')
depends=('qt5-base')
makedepends=(
	'cmake'
	'git'
	'ninja'
)
provides=('uoj-data-converter')
conflicts=('uoj-data-converter')
source=('git://github.com/ouuan/uoj-data-converter.git')
md5sums=('SKIP')

pkgver() {
	cd uoj-data-converter
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd uoj-data-converter
	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -GNinja
	cmake --build build
}

package() {
	cd uoj-data-converter/build
	DESTDIR="$pkgdir/" ninja install
}
