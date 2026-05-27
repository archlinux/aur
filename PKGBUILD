# Maintainer: Josh Chernoff <joshchernoff@fullstack.ing>
pkgname=spellr
pkgver=0.1.0
pkgrel=1
pkgdesc="KDE spell checker with ranked suggestions, text-to-speech, and session history"
arch=('x86_64')
url="https://codeberg.org/FullStacking/spellr"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-speech'
    'kf6-sonnet'
    'kf6-kxmlgui'
    'kf6-ki18n'
    'kf6-kwidgetsaddons'
    'kf6-kcoreaddons'
    'hunspell'
    'flite'
    'wl-clipboard'
)
makedepends=('cmake' 'extra-cmake-modules' 'ninja' 'git')
install=spellr.install
source=("spell-$pkgver::git+https://codeberg.org/FullStacking/spellr.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cmake -B build -S "spell-$pkgver" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "spell-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
