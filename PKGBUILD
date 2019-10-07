# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgbase=rom-properties-all
pkgname=(
	'rom-properties-all'
	'rom-properties-docs'
	'rom-properties-cli'
	'rom-properties-gnome'
	'rom-properties-gtk3-common'
	'rom-properties-kde5'
	'rom-properties-lang'
	'rom-properties-mate'
	'rom-properties-stub'
	'rom-properties-thumbnailer-dbus'
	'rom-properties-xdg'
	'rom-properties-xfce'
)
pkgver=1.4.3
pkgrel=1
pkgdesc="ROM Properties Page shell extension meta package"
arch=('x86_64')
url="https://github.com/GerbilSoft/rom-properties"
license=('GPL2')
depends=('zlib' 'tinyxml2' 'nettle' 'libpng' 'curl' 'libjpeg-turbo' 'glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GerbilSoft/rom-properties/archive/v$pkgver.tar.gz")
sha256sums=('21e2ac5e4f90a8b64837f8aaeac401e4a14ad1a6a8ba604c16f10182f3617655')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir build
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake -DUSE_INTERNAL_XML=False -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package_rom-properties-all() {
	depends=(
		'rom-properties-docs' 'rom-properties-cli' 'rom-properties-gnome'
		'rom-properties-gtk3-common' 'rom-properties-kde5' 'rom-properties-lang'
		'rom-properties-mate' 'rom-properties-stub' 'rom-properties-thumbnailer-dbus'
		'rom-properties-xdg' 'rom-properties-xfce'
	)
}

package_rom-properties-docs() {
	pkgdesc="ROM Properties Page shell extension documentation"

	cd "$pkgname-$pkgver/build/doc"

	make DESTDIR="$pkgdir" install
}

package_rom-properties-cli() {
	pkgdesc="ROM Properties Page shell extension (command line version)"
	depends=("rom-properties-docs")
	optdepends=("rom-properties-lang: localization")

	cd "$pkgname-$pkgver/build/src/rpcli"

	make DESTDIR="$pkgdir" install
}

package_rom-properties-gnome() {
	pkgdesc="ROM Properties Page shell extension for GNOME"
	depends=("rom-properties-docs" "rom-properties-gtk3-common" "rom-properties-stub" "libnautilus-extension" "cairo" "gtk3" "glib2")
	optdepends=("rom-properties-lang: localization")

	cd "$pkgname-$pkgver/build/src/gtk/gnome"

	make DESTDIR="$pkgdir" install
}

package_rom-properties-gtk3-common() {
	pkgdesc="ROM Properties Page shell extension (common files for GNOME and MATE)"
	depends=("rom-properties-stub")
	optdepends=("rom-properties-lang: localization")

	cd "$pkgname-$pkgver/build/src/gtk"

	make DESTDIR="$pkgdir" install/local
}

package_rom-properties-kde5() {
	pkgdesc="ROM Properties Page shell extension for KDE 5"
	depends=("kio" "kfilemetadata" "kwidgetsaddons" "qt5-base" "qt5-tools" "kcoreaddons" "extra-cmake-modules")
	optdepends=("rom-properties-lang: localization")

	cd "$pkgname-$pkgver/build/src/kde"

	make DESTDIR="$pkgdir" install
}

package_rom-properties-lang() {
	pkgdesc="ROM Properties Page shell extension language files"

	cd "$pkgname-$pkgver/build/locale"

	make DESTDIR="$pkgdir" install
}

package_rom-properties-mate() {
	pkgdesc="ROM Properties Page shell extension for GNOME"
	depends=("rom-properties-docs" "rom-properties-gtk3-common" "rom-properties-stub" "caja" "cairo" "gtk3" "glib2")
	optdepends=("rom-properties-lang: localization")

	cd "$pkgname-$pkgver/build/src/gtk/mate"

	make DESTDIR="$pkgdir" install
}

package_rom-properties-stub() {
	pkgdesc="ROM Properties Page shell extension (stub executable)"
	optdepends=("rom-properties-lang: localization")

	cd "$pkgname-$pkgver/build/src/rp-stub"

	make DESTDIR="$pkgdir" install
}

package_rom-properties-thumbnailer-dbus() {
	pkgdesc="ROM Properties Page shell extension (D-Bus Thumbnailer service for XFCE)"
	depends=("rom-properties-docs" "thunar" "glib2")
	optdepends=("rom-properties-lang: localization")

	cd "$pkgname-$pkgver/build/src/gtk/thumbnailer-dbus"

	make DESTDIR="$pkgdir" install
}

package_rom-properties-xdg() {
	pkgdesc="ROM Properties Page shell extension MIME files"

	cd "$pkgname-$pkgver/build/xdg"

	make DESTDIR="$pkgdir" install
}

package_rom-properties-xfce() {
	pkgdesc="ROM Properties Page shell extension for XFCE (GTK+ 3.x)"
	depends=("rom-properties-docs" "rom-properties-thumbnailer-dbus" "thunar" "cairo" "gtk3" "glib2")
	optdepends=("rom-properties-lang: localization")

	cd "$pkgname-$pkgver/build/src/gtk/xfce3"

	make DESTDIR="$pkgdir" install
}
