# Maintainer: KspLite <ksplite@outlook.com>
pkgname=64gram-desktop
_pkgname=64Gram
pkgver=2.9.3.1
pkgrel=2
pkgdesc='Unofficial desktop version of Telegram messaging app'
arch=('x86_64')
url="https://github.com/TDesktop-x64/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'libtg_owt')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'extra-cmake-modules' 'gtk3' 'webkit2gtk')
optdepends=('gtk3: GTK environment integration'
            'webkit2gtk: embedded browser features'
            'ttf-opensans: default Open Sans font family'
            'xdg-desktop-portal: desktop integration')
provides=("64gram-desktop")
conflicts=("telegram-desktop" "tdesktop-x64")
replaces=("tdesktop-x64")
source=("https://github.com/TDesktop-x64/tdesktop/releases/download/v${pkgver}/${_pkgname}-${pkgver}-full.tar.gz")
sha512sums=('4874ef1002c80724f618ff6a316674ac45e8c7fc0a1d8a2604fbc405124db44cd733ef9a2cf0dec9c3ca9a38473729317b80f4d074b8b90adfb5c231be883c2e')

build() {
    cd $_pkgname-$pkgver-full

    # Official API ID&Hash by default
    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON
    ninja -C build
}

package() {
    cd $_pkgname-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
