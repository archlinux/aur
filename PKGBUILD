# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: William Franco Abdul Hai <williamhai at hotmail dot com>

pkgname='koi'
pkgver=0.2.1
pkgrel=1
pkgdesc="Switch between light and dark themes on KDE Plasma"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('plasma-desktop' 'kconfig' 'kcoreaddons' 'kwidgetsaddons')
makedepends=('qt5-base')
source=("https://github.com/baduhai/Koi/archive/$pkgver.tar.gz")
sha256sums=('dd87c3d09913e56c8585a28c9db6c36b3f27e798bd33127c05e1e638d6aa2aed')

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
    install -D "src/build/bin/Koi" "$pkgdir/usr/bin/Koi"
    install -Dm644 "src/koi.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "src/resources/icons/koi.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "src/resources/icons/koi_tray.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}_tray.svg"
}
