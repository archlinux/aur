# Maintainer: Adrian Schmitz <zetabite.horzion@gmail.com>
pkgname=multimc-bin
pkgver=0.6.12.1438
pkgrel=2
pkgdesc="Free, open source launcher and instance manager for Minecraft."
arch=('i686' 'x86_64')
url="http://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg' 'xorg-xrandr' 'zenity' 'wget')
conflicts=('multimc' 'multimc5' 'multimc5-git')
provides=('multimc' 'multimc5' 'multimc5-git')
source=("$pkgname-$pkgver.deb::https://files.multimc.org/downloads/multimc_1.5-1.deb")
sha512sums=('26fe11eff406efd09612002e4c53fc1ea0b3f7d0aca389475a7afff454efa52ed52097f6a0bbc27de61fba3fed252321754738a0f79b0d8a7308a39701087e67')
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
