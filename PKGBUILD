# Maintainer:  Petr Mrázek <peterix@gmail.com>
pkgname=multimc-bin
pkgver=1.6
pkgrel=1
pkgdesc="Free, open source launcher and instance manager for Minecraft."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'qt5-svg' 'xorg-xrandr' 'zenity' 'wget')
conflicts=('multimc' 'multimc5' 'multimc5-git')
provides=('multimc' 'multimc5' 'multimc5-git')
source=("$pkgname-$pkgver.deb::https://files.multimc.org/downloads/multimc_$pkgver-$pkgrel.deb")
sha1sums=('b943427e5f32f6a41d77a373029731c67571901d')
noextract=("$pkgname-$pkgver.deb")

prepare() {
	mkdir -p $pkgname-$pkgver && bsdtar -xf $pkgname-$pkgver.deb -C $pkgname-$pkgver
	cd $srcdir/$pkgname-$pkgver && bsdtar -xf data.tar.xz -C $srcdir/$pkgname-$pkgver
}

package() {
	mkdir -p "$pkgdir/opt/multimc"
	mkdir -p "$pkgdir/usr/share/metainfo"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/bin"

	cp -R "$srcdir/$pkgname-$pkgver/opt/multimc/" -T "$pkgdir/opt/multimc/"
	cp -R "$srcdir/$pkgname-$pkgver/usr/share/metainfo/" -T "$pkgdir/usr/share/metainfo/"
	cp -R "$srcdir/$pkgname-$pkgver/usr/share/applications/" -T "$pkgdir/usr/share/applications/"

	install -m644 -D "$srcdir/$pkgname-$pkgver/usr/share/applications/multimc.desktop" "$pkgdir/usr/share/applications/multimc.desktop"
	install -m644 -D "$srcdir/$pkgname-$pkgver/usr/share/metainfo/multimc.metainfo.xml" "$pkgdir/usr/share/metainfo/multimc.metainfo.xml"
	install -m644 -D "$srcdir/$pkgname-$pkgver/opt/multimc/icon.svg" "$pkgdir/opt/multimc/icon.svg"
	install -m755 -D "$srcdir/$pkgname-$pkgver/opt/multimc/run.sh" "$pkgdir/opt/multimc/run.sh"
	ln -s "/opt/multimc/run.sh" "$pkgdir/usr/bin/multimc"
}
