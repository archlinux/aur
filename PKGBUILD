# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

pkgname=forkgram
_pkgname=frk
pkgver=3.5.1
pkgrel=2
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/Forkgram/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'qt5-svg' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'libtg_owt' 'qt6-base' 'qt6-wayland' 'qt6-5compat' 'qt6-svg')
makedepends=('cmake' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'gcc' 'abseil-cpp' 'meson'
             'extra-cmake-modules' 'gtk3' 'webkit2gtk')
optdepends=('gtk3: GTK environment integration'
            'webkit2gtk: embedded browser features'
            'ttf-opensans: default Open Sans font family'
            'xdg-desktop-portal: desktop integration')
provides=("telegram-desktop")
conflicts=("telegram-desktop" "tdesktop-x64")
replaces=("tdesktop-x64")
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz")
sha512sums=('d1d52af3d2bbe8f0c28cc2981dcbde7d3d74ca2957ccb234eaddf7f3d3b5c95dc5285b671a9c9826fbf4c9de816113fd776e6a884bfcf8ba6c0c9c42fe9e7848')

build() {
    cd $_pkgname-v$pkgver-full

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
    cd $_pkgname-v$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
