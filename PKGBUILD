pkgname=nemo-megasync
pkgver=2.9.2
pkgrel=1
pkgdesc="MEGASync extension for the Nemo file browser"
arch=('x86_64' 'i686')
url="https://github.com/Pival81/nemo-megasync"
license=('custom')
depends=('nemo' 'megasync')
install=nemo-megasync.install
source=("https://github.com/Pival81/nemo-megasync/archive/2.9.2.tar.gz")
md5sums=("bb98b774bd1871ac1baaeeaa7edb6d1b")

prepare() {
	export DESKTOP_DESTDIR=$pkgdir/usr
}

build() {
	cd nemo-megasync-2.9.2
	qmake-qt4 
	make
}

package() {
	cd nemo-megasync-2.9.2
	make install
	mkdir -p $pkgdir/usr/lib/nemo/extensions-3.0
	install libMEGAShellExtNemo.so.1.0.0 -D $pkgdir/usr/lib/nemo/extensions-3.0/
	cd $pkgdir/usr/lib/nemo/extensions-3.0/
	ln -s libMEGAShellExtNemo.so.1.0.0 libMEGAShellExtNemo.so
	ln -s libMEGAShellExtNemo.so.1.0.0 libMEGAShellExtNemo.so.1
	ln -s libMEGAShellExtNemo.so.1.0.0 libMEGAShellExtNemo.so.1.0
	rm -fr $pkgdir/usr/share/icons/hicolor/icon-theme.cache
}
