# $Id: PKGBUILD 120392 2014-10-08 11:11:31Z idevolder $
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>
# Contributor: Zom <zom@eevul.org>

pkgname=apper
epoch=1
pkgver=0.9.2
pkgrel=1
pkgdesc="KDE tools for PackageKit"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Apper?content=84745"
license=('GPL')
depends=('packagekit-qt4' 'kdebase-runtime')
makedepends=('cmake' 'automoc4' 'kdebase-workspace')
optdepends=('kdebase-workspace: updates daemon')
install="$pkgname.install"
source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('5bc52b3db723603e12ab98205d54c7c9364905b54939499271db33d82bdd227f')

prepare() {
        mkdir -p build
}

build() {
	cd build

	cmake ../$pkgname-$pkgver \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
	# avoid gnome-packagekit conflict (stolen from fedora as suggested)
	mv "$pkgdir/usr/share/dbus-1/services/org.freedesktop.PackageKit.service" \
		"$pkgdir/usr/share/dbus-1/services/kde-org.freedesktop.PackageKit.service"
}
