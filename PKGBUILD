# Maintainer: Brandon Hall <brandonjhall@windstream.net>
pkgname=aurbrowser
pkgver=1.1.1
pkgrel=1
pkgdesc="A Qt application that allows an Arch Linux user to browse and install packages from the AUR."
arch=('x86_64')
url="https://gitlab.com/brandonjhall/aurbrowser"
license=('GPL')
depends=('qtermwidget>=0.8.0-1' 'qt5-base>=5.10.0-1' 'gcc-libs>=7.2.1+20180116-1' 'glibc>=2.26-11' 'sudo')
makedepends=()
source=($pkgname-$pkgver.tar.gz::"https://gitlab.com/brandonjhall/aurbrowser/repository/v1.1.1/archive.tar.gz")
install=aurbrowser.install
md5sums=('17568ec846e57bd3302df0c8222db81b')
commitsha=27b1189d0788f43a5a7207332a728c1349c6fb96

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
