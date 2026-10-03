# Maintainer: Dresden Wildey <dresden196@gmail.com>
pkgname=stoke-qt
# stoke-qt was this package's name up to 0.2.1.
provides=('fubuki-ui' 'fubuki-qt')
conflicts=('fubuki-ui' 'fubuki-qt')
replaces=('fubuki-ui' 'fubuki-qt')
_base=stoke
pkgver=0.3.0
pkgrel=1
pkgdesc="Bootable USB writer in the spirit of Rufus: the KDE window"
arch=('x86_64')
url="https://github.com/dresden196/stoke"
license=('GPL-3.0-or-later')
depends=('stoke' 'qt6-base' 'qt6-declarative' 'kirigami' 'ki18n' 'qqc2-desktop-style' 'polkit' 'systemd')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'gettext')
source=("$_base-$pkgver.tar.gz::https://github.com/dresden196/stoke/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e48bd1730791197ee7705cd6853e2d87e84cece6fcd2e944b160417f5d778d8')

build() {
    cmake -S "$srcdir/$_base-$pkgver/stoke-qt/app" -B "$srcdir/build" \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "$srcdir/build" --parallel
}

package() {
    cd "$srcdir/$_base-$pkgver/stoke-qt"
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
    ln -s stoke-qt "$pkgdir/usr/bin/fubuki-qt"
    ln -s stoke-qt "$pkgdir/usr/bin/fubuki-ui"
    install -Dm644 io.github.dresden196.stoke.desktop \
        "$pkgdir/usr/share/applications/io.github.dresden196.stoke.desktop"
}
