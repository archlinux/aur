# Maintainer: Brandon Hall <brandonjhall@windstream.net>
pkgname=aurbrowser
pkgver=1.2.0
pkgrel=1
pkgdesc="A Qt application that allows an Arch Linux user to browse and install packages from the AUR."
arch=('x86_64')
url="https://gitlab.com/brandonjhall/aurbrowser"
license=('GPL')
depends=('qt5-base>=5.10.0-1' 'gcc-libs>=7.2.1+20180116-1' 'glibc>=2.26-11' 'sudo')
makedepends=()
source=($pkgname-$pkgver.tar.gz::"https://gitlab.com/brandonjhall/aurbrowser/repository/v1.2.0/archive.tar.gz")
install=aurbrowser.install
md5sums=('2c03c04fae16afc5557573138dbe0590')
commitsha=d03918364ab5e87ddfb0ead11bcb26b6476a94e3

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
