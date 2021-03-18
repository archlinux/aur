# Maintainer: Clay Stan <claystan97@gmail.com>
pkgname=cornus
pkgver=1.0.6
pkgrel=1
pkgdesc="A fast file browser for Linux"
arch=('any')
url="https://github.com/f35f22fan/Cornus"
license=('GPL3')
depends=('qt5-base' 'dconf' 'udisks2' 'ark')
makedepends=('cmake')
source=("https://github.com/f35f22fan/Cornus/archive/v1.0.6.tar.gz")
md5sums=('83fb04ff43b6a175fdcd8e8dca259783')
validpgpkeys=("4588 CB58 CB89 35FA C7DD  02D0 23C0 FC60 B040 BEC3")
_pkgName=Cornus

build() {
	cd "$_pkgName-$pkgver"
	mkdir build
	cd build
	cmake ../
	make -j8
}

package() {
	mkdir -p ${pkgdir}/usr/share/cornus/
	cp -r "$_pkgName-$pkgver"/file_icons/ ${pkgdir}/usr/share/cornus/
	install -Dm644 "$_pkgName-$pkgver"/export/cornus_mas.desktop ${pkgdir}/usr/share/applications/cornus.desktop
	install -Dm644 "$_pkgName-$pkgver"/resources/cornus.mas.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/cornus.mas.png
	install -D "$_pkgName-$pkgver"/build/cornus ${pkgdir}/usr/bin/cornus
	install "$_pkgName-$pkgver"/build/cornus_io ${pkgdir}/usr/bin/cornus_io
}
