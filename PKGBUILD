# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: William Franco Abdul Hai <williamhai at hotmail dot com>

pkgname='koi-git'
_pkgname='koi'
pkgver=0.1.1.r26.ga1b6bea
pkgrel=2
pkgdesc="Switch between light and dark themes on KDE Plasma"
arch=('x86_64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('plasma-desktop' 'kconfig' 'kcoreaddons' 'kwidgetsaddons')
makedepends=('qt5-base' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
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
    install -Dm644 "src/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "src/resources/icons/$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -Dm644 "src/resources/icons/koi_tray.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/koi_tray.svg"
}
