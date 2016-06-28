# Maintainer: Dmitriy Morozov <dmorozov.mailbox@gmail.com>

pkgname=qputty-qt5-git
pkgver=504
pkgrel=1
pkgdesc="A Qt 5 port for putty, the free telnet/ssh client"
arch=('i686' 'x86_64')
url="https://github.com/dsmorozov/qputty-qt5"
license=('MIT LGPL3')
depends=('glibc' 'gcc-libs' 'qt5-base' 'qt5-x11extras' 'libgssglue')
makedepends=('git')
conflicts=('qputty')
source=('git://github.com/dsmorozov/qputty-qt5.git'
        'git://git.tartarus.org/simon/putty.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.putty.url $srcdir/putty
	git submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

package() {
	cd $srcdir/${pkgname%-git}
	install -Dm0755 qPutty "$pkgdir/usr/bin/qPutty"
	install -Dm0644 qPutty.desktop "$pkgdir/usr/share/applications/qPutty.desktop"
	install -Dm0644 icons/qputty.svgz "$pkgdir/usr/share/icons/hicolor/scalable/apps/qputty.svgz"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/qputty-qt5/LICENSE"
}
