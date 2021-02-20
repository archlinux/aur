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
url="http://www.ganttproject.biz/"
license=("GPL")
depends=('jre11-openjdk' 'java11-openjfx' 'hicolor-icon-theme')
makedepends=('unzip')
source=("http://dl.ganttproject.biz/$pkgname-$pkgver/$pkgname-$pkgver.zip"
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

md5sums=('adcb40b3b9c1298f28a5d72168b9e12d'
         '5139adddebc92d9da94b8448176d4d21')
