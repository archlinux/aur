# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: William Franco Abdul Hai <williamhai at hotmail dot com>

pkgname='koi-git'
_pkgname='koi'
pkgver=0.2.1.r4.ge1d0979
pkgrel=1
pkgdesc="Switch between light and dark themes on KDE Plasma"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('kconfig' 'kcoreaddons' 'kwidgetsaddons' 'kpackage' 'hicolor-icon-theme')
makedepends=('qt5-base' 'git' 'extra-cmake-modules')
optdepends=('xsettingsd: Apply settings to GTK applications on the fly')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/baduhai/Koi.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname/src"
    mkdir -p build && cd build

    cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..

    make
}

package() {
    cd "$srcdir/$pkgname"
    install -D "src/build/bin/Koi" "$pkgdir/usr/bin/Koi"
    install -Dm644 "src/koi.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "src/resources/icons/koi.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
    install -Dm644 "src/resources/icons/koi_tray.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}_tray.svg"
}
