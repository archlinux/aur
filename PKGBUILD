# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: William Franco Abdul Hai <williamhai at hotmail dot com>

pkgname='koi'
pkgver=0.2.3
pkgrel=1
pkgdesc="Switch between light and dark themes on KDE Plasma"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('plasma-desktop' 'kconfig' 'kcoreaddons' 'kwidgetsaddons')
makedepends=('qt5-base')
source=("https://github.com/baduhai/Koi/archive/$pkgver.tar.gz")
sha256sums=('811f6bdaa8146f0da6103742816cc48f571d344d2cd8cd9ac2448ca518825e32')

build() {
	cd "Koi-$pkgver/src"
    mkdir -p build && cd build

    cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..

    make
}

package() {
    cd "Koi-$pkgver"
    install -D "src/build/bin/koi" "$pkgdir/usr/bin/koi"
    install -Dm644 "src/koi.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "src/resources/icons/koi.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "src/resources/icons/koi_tray.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}_tray.svg"
}
