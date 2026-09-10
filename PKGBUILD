# Maintainer: Dresden Wildey <dresden196@gmail.com>
pkgname=fubuki-qt
# fubuki-qt was this package's name up to 0.2.1.
provides=('fubuki-ui')
conflicts=('fubuki-ui')
replaces=('fubuki-ui')
_base=fubuki
pkgver=0.2.3
pkgrel=1
pkgdesc="Bootable USB writer in the spirit of Rufus: the KDE window"
arch=('x86_64')
url="https://github.com/dresden196/fubuki"
license=('GPL-3.0-or-later')
depends=('fubuki' 'qt6-base' 'qt6-declarative' 'kirigami' 'ki18n' 'qqc2-desktop-style' 'polkit' 'systemd')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'gettext')
source=("$_base-$pkgver.tar.gz::https://github.com/dresden196/fubuki/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69a2b4d4bc15cfc907086d8c2938215ff1267bb8cebb94db9ffd49b64d9a587b')

build() {
    cmake -S "$srcdir/$_base-$pkgver/fubuki-qt/app" -B "$srcdir/build" \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "$srcdir/build" --parallel
}

package() {
    cd "$srcdir/$_base-$pkgver/fubuki-qt"
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
    ln -s fubuki-qt "$pkgdir/usr/bin/fubuki-ui"
    install -Dm644 io.github.dresden196.fubuki.desktop \
        "$pkgdir/usr/share/applications/io.github.dresden196.fubuki.desktop"
}
