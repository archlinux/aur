# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: William Franco Abdul Hai <williamhai at hotmail dot com>

pkgname='koi'
pkgver=0.1.1.r26.ga1b6bea
pkgrel=1
pkgdesc="Switch between light and dark themes on KDE Plasma"
arch=('x86_64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('plasma-desktop' 'kconfig' 'kcoreaddons' 'kwidgetsaddons')
makedepends=('qt5-base')
source=("$pkgname::git://github.com/baduhai/Koi")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
    qmake src/Koi.pro
	make
}

package() {
    cd "$srcdir/$pkgname"
    install -D "Koi" "$pkgdir/usr/bin/Koi"
    install -Dm644 "src/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "src/resources/icons/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "src/resources/icons/koi_tray.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/koi_tray.svg"
}
