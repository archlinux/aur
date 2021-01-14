# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: William Franco Abdul Hai <williamhai at hotmail dot com>

pkgname='koi-git'
_pkgname='koi'
pkgver=0.1.1.r157.g452fc47
pkgrel=1
pkgdesc="Switch between light and dark themes on KDE Plasma"
arch=('x86_64')
url="https://github.com/Da-Viper/Koi"
license=('LGPL3')
depends=('kconfig' 'kcoreaddons' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-base' 'git' 'extra-cmake-modules')
optdepends=('xsettingsd: Apply settings to GTK applications on the fly')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git://github.com/Da-Viper/Koi")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake -G "Unix Makefiles" ..
	make
}

package() {
    cd "$srcdir/$pkgname"
    install -D "build/src/koi" "$pkgdir/usr/bin/koi"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "resources/icons/$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -Dm644 "resources/icons/koi_tray.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/koi_tray.svg"
}
