# Maintainer: Eric DeStefano <eric at ericdestefano dot com>

pkgname=sheepshaver
pkgver=2e302d6
pkgrel=1
pkgdesc="An Open Source PowerMac Emulator"
arch=('x86_64')
url="http://sheepshaver.cebix.net"
license=('GPL')
depends=('gtk2' 'sdl')
provides=('sheepshaver')
install=$pkgname.install
source=('https://github.com/cebix/macemu/zipball/master/cebix-macemu-2e302d6.zip'
'99-sheepshaver.conf'
'SheepShaver.desktop'
'SheepShaver.png')
sha256sums=('ebad98765ece1756e76f5a9d42b8560340b98bb458080bba173472362658454a'
'a4aa858b95d29906873693988d5db42d5a4da8aa94a72c79374f59fc488efd51'
'cb002e73e864a6ca271e0bbaa6df6eb89dc1df86856fc575c20bf79367458c39'
'b7f67b1f8424f3e0ffa1a5e57597f368c4c4f93ea1f871ec0a76700b7519b241')

build() {
  cd $srcdir/cebix-macemu-$pkgver/SheepShaver/src/Unix
  ./autogen.sh --prefix=/usr --enable-sdl-audio --enable-sdl-video --with-bincue
  make
}

package() {
	install -Dm755 "$srcdir/cebix-macemu-$pkgver/SheepShaver/src/Unix/SheepShaver" "${pkgdir}/usr/bin/SheepShaver"
	mkdir -p ${pkgdir}/etc/sysctl.d
	install -Dm644 "$srcdir/99-sheepshaver.conf" "${pkgdir}/etc/sysctl.d/"
	mkdir -p ${pkgdir}/usr/share/doc
	mkdir ${pkgdir}/usr/share/pixmaps
	cp -a $srcdir/cebix-macemu-2e302d6/SheepShaver/doc/Linux $pkgdir/usr/share/SheepShaver
	install -Dm644 ../SheepShaver.png $pkgdir/usr/share/pixmaps/SheepShaver.png
	mkdir ${pkgdir}/usr/share/applications
	install -Dm644 ../SheepShaver.desktop $pkgdir/usr/share/applications/SheepShaver.desktop
}
