# Maintainer: SanskritFritz (gmail)
# Maintainer: Grigoris Pavlakis (aur.archlinux.org/account/lightspot21)
# Contributor: zertyz <zertyz@gmail.com>
# Contributor: craeckie (aur.archlinux.org/account/craeckie)
# Contributor: Oliver Kahrmann <oliver.kahrmann@gmail.com>
# Original Author: David Fuhr <david.fuhr@web.de>

pkgname=ganttproject
_version=3.3
_build=3316
pkgver=$_version.$_build
pkgrel=1
pkgdesc="A project scheduling application featuring gantt chart, resource management, calendaring."
arch=('i686' 'x86_64')
url="https://www.ganttproject.biz/"
license=("GPL")
depends=('java-runtime' 'java-openjfx' 'hicolor-icon-theme')
makedepends=('unzip')
source=("https://dl.ganttproject.biz/$pkgname-$pkgver/$pkgname-$pkgver.zip"
	"ganttproject.desktop"
	"ganttproject.patch")

prepare() {
	# add JavaFX path to startup script, from java-openjfx package
	# (adapted from ulyssesrr's script)
	cd $srcdir
	patch -p1 -i $pkgname.patch
}

package() {
	mkdir -p "$pkgdir/opt/"
	cp --recursive "$srcdir" "$pkgdir/opt/$pkgname"

	chmod 755 "$pkgdir/opt/$pkgname/ganttproject"
	install -D -m0644 "$srcdir/ganttproject.desktop" "$pkgdir/usr/share/applications/ganttproject.desktop"
	install -D -m0644 "$srcdir/plugins/base/ganttproject/resources/icons/ganttproject.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/ganttproject.png"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/ganttproject" "$pkgdir/usr/bin/ganttproject"
}

sha256sums=('d662c4aed3fc9aed24d5ec1f568c9bdf86cf10e54fa472772b988e0f20eca4d9'
            '7f80539115a2ffa518516671596b7e35659d46c91ac39133cc5accda9dec3862'
            '303b6d44d8fe08936fe8110365268b5e708ec0f608ff5c42c88ea46c83f0d7dc')
