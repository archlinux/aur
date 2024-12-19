# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=hyprpolkitagent
pkgver=0.1.1
pkgrel=2
pkgdesc="A simple polkit authentication agent for Hyprland, written in QT/QML"
arch=('x86_64')
url="https://github.com/hyprwm/$pkgname"
license=('BSD-3-Clause')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('55bb1c6e51a1724d5f8914e787f7c37463b63ca55ea4dc09af30706eca648158')
depends=('gcc-libs' 'qt6-base' 'polkit-qt6' 'qt6-declarative' 'glib2')
makedepends=('git' 'cmake' 'gcc' 'qqc2-desktop-style' 'hyprutils')

build() {
    cd "$pkgname-$pkgver"
    cmake \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
        --no-warn-unused-cli \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -S . \
        -B ./build
    cmake --build ./build --config Release --target "$pkgname"
}

package() {
    cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" cmake --install build

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
