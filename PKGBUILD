# Maintainer: Brandon Hall <brandonjhall@windstream.net>
pkgname=aurbrowser
pkgver=1.1.0
pkgrel=1
pkgdesc="A Qt application that allows an Arch Linux user to browse and install packages from the AUR."
arch=('x86_64')
url="https://gitlab.com/brandonjhall/aurbrowser"
license=('GPL')
depends=('qtermwidget>=0.8.0-1' 'qt5-base>=5.10.0-1' 'gcc-libs>=7.2.1+20180116-1' 'glibc>=2.26-11')
makedepends=()
source=($pkgname-$pkgver.tar.gz::"https://gitlab.com/brandonjhall/aurbrowser/repository/v1.1.0/archive.tar.gz")
install=aurbrowser.install
md5sums=('81c594e886de8042dc309c0023f791fa')
commitsha=28c57da47f3b5abbf4bf316bb60333e823e4b1dd

prepare() {
        cd "$pkgname-v$pkgver-$commitsha"
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
