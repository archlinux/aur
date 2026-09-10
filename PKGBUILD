# Maintainer: Dresden Wildey <dresden196@gmail.com>
pkgname=fubuki-ui
_base=fubuki
pkgver=0.2.1
pkgrel=1
pkgdesc="Bootable USB writer in the spirit of Rufus: the KDE window"
arch=('x86_64')
url="https://github.com/dresden196/fubuki"
license=('GPL-3.0-or-later')
depends=('fubuki' 'qt6-base' 'qt6-declarative' 'kirigami' 'ki18n' 'qqc2-desktop-style' 'polkit' 'systemd')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'gettext')
source=("$_base-$pkgver.tar.gz::https://github.com/dresden196/fubuki/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40de60269ab4b610bd45362c45da11266eaf1583445f5803036cf5e8d8766370')

build() {
    cmake -S "$srcdir/$_base-$pkgver/fubuki-ui/app" -B "$srcdir/build" \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "$srcdir/build" --parallel
}

package() {
    cd "$srcdir/$_base-$pkgver/fubuki-ui"
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
    install -Dm644 io.github.dresden196.fubuki.desktop \
        "$pkgdir/usr/share/applications/io.github.dresden196.fubuki.desktop"
}
