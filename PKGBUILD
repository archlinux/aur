pkgbase=libvlc
pkgname=('libvlc' 'libvlccore')
_pkgname=vlc
pkgver=5.6.0
_pkgver=3.0.4-4
pkgrel=4
pkgdesc="The VLC library not bundled with VLC so one can use things depending on the lib without installing VLC"
arch=('x86_64')
url='https://www.videolan.org/LibVLC/'
license=('LGPL2.1')
source=("https://archive.archlinux.org/packages/v/${_pkgname}/${_pkgname}-${_pkgver}-x86_64.pkg.tar.xz")
md5sums=('db8e24f6792a9e30f85a11e1e6c115f0')

package_libvlc() {
	depends=('libvlccore')
	provides=("libvlc=$pkgver" "vlc") # This should not provide vlc but all arch packages dep on vlc when they only need libvlc
	conflicts=('vlc')
	cd $srcdir/usr/lib
	mkdir -p $pkgdir/usr/lib
	install -Dm644 $pkgname.so.$pkgver $pkgdir/usr/lib/
	ln -s /usr/lib/$pkgname.so.$pkgver $pkgdir/usr/lib/$pkgname.so.5
	ln -s /usr/lib/$pkgname.so.$pkgver $pkgdir/usr/lib/$pkgname.so
}

package_libvlccore() {
	depends=('libidn' 'dbus')
	provides=(libvlccore=9.0.0)
	_libver=9.0.0
	cd $srcdir/usr/lib
	mkdir -p $pkgdir/usr/lib
	install -Dm644 $pkgname.so.$_libver $pkgdir/usr/lib/
	ln -s /usr/lib/$pkgname.so.$_libver $pkgdir/usr/lib/$pkgname.so.9
	ln -s /usr/lib/$pkgname.so.$_libver $pkgdir/usr/lib/$pkgname.so
}

