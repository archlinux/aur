# Maintainer: SanskritFritz (gmail)
# Maintainer: Grigoris Pavlakis (aur.archlinux.org/account/lightspot21)
# Contributor: zertyz <zertyz@gmail.com>
# Contributor: craeckie (aur.archlinux.org/account/craeckie)
# Contributor: Oliver Kahrmann <oliver.kahrmann@gmail.com>
# Original Author: David Fuhr <david.fuhr@web.de>

pkgname=ganttproject
_version=3.0
_build=3000
pkgver=$_version.$_build
pkgrel=1
pkgdesc="A project scheduling application featuring gantt chart, resource management, calendaring."
arch=('i686' 'x86_64')
url="https://www.ganttproject.biz/"
license=("GPL")
depends=('jre11-openjdk' 'java11-openjfx' 'hicolor-icon-theme')
makedepends=('unzip')
source=("https://dl.ganttproject.biz/$pkgname-$pkgver/$pkgname-$pkgver.zip"
	"ganttproject.desktop")

prepare() {
	# add JavaFX path to startup script
	sed -i '/^BOOT_CLASS/ aJFX_ARGS="--module-path \/usr\/lib\/jvm\/java-11-openjfx\/lib\/ --add-modules=ALL-MODULE-PATH"' $srcdir/ganttproject-$pkgver/ganttproject
	sed -i '/^JAVA_ARGS/ s/$DEBUG_ARGS/$DEBUG_ARGS $JFX_ARGS/' $srcdir/ganttproject-$pkgver/ganttproject
}

package() {
	mkdir -p "$pkgdir/opt/"
	cp --recursive "$srcdir/ganttproject-$pkgver" "$pkgdir/opt/$pkgname"

	chmod 755 "$pkgdir/opt/$pkgname/ganttproject"
	install -D -m0644 "$srcdir/ganttproject.desktop" "$pkgdir/usr/share/applications/ganttproject.desktop"
	install -D -m0644 "$srcdir/ganttproject-$pkgver/plugins/base/ganttproject/resources/icons/ganttproject.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/ganttproject.png"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/ganttproject" "$pkgdir/usr/bin/ganttproject"
}

sha256sums=('3e139aa5f2f8ef44af7f278579f5fb09c7cbb5b102e8e1e6abb2e1cf5c3b2160'
			'7f80539115a2ffa518516671596b7e35659d46c91ac39133cc5accda9dec3862')