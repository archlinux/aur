# Maintainer: Brandon Hall <brandonjhall@windstream.net>
pkgname=aurbrowser
pkgver=1.3.0
pkgrel=3
pkgdesc="A Qt application that allows an Arch Linux user to browse and install packages from the AUR."
arch=('x86_64')
url="https://gitlab.com/brandonjhall/aurbrowser"
license=('GPL')
depends=('qt5-base>=5.10.0-1' 'gcc-libs>=7.2.1+20180116-1' 'glibc>=2.26-11' 'sudo')
makedepends=()
source=($pkgname-$pkgver.tar.gz::"https://gitlab.com/brandonjhall/aurbrowser/repository/v$pkgver/archive.tar.gz")
install=aurbrowser.install
md5sums=('f72f1321227870053c2723b20ff497b3')
commitsha=7e6e070d2a8e2bc2d22553b115a3e2ef5181e5c7

prepare() {
	cd "$pkgname-v$pkgver-$commitsha"
	sed -i 's/Path=\/usr\/local\/bin/Path=\/usr\/bin/g' AUR-Browser.desktop
	qmake "INSTALL_PREFIX=$pkgdir/usr"
}

build() {
	cd "$pkgname-v$pkgver-$commitsha"
	make
}

check() {
	cd "$pkgname-v$pkgver-$commitsha"
	make -k check
}

package() {
	cd "$pkgname-v$pkgver-$commitsha"
	make DESTDIR="$pkgdir/usr/bin" install
}
