# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname=forkgram
_pkgname=frk
pkgver=4.7
pkgrel=2
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/Forkgram/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm-2.68'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl-1.1' 'protobuf')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=(telegram-desktop)
conflicts=(telegram-desktop)
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz")
sha512sums=('cd3cf0d6c548464d3955b9ece2604eedbf02089d6753ed7f919f21f0f82a255ef22a923bff9ccac61ca52be87415096a2a9deb7049856397df63d6181612b338')

build() {
    CXXFLAGS+=' -ffat-lto-objects'
    cmake -B build $_pkgname-v$pkgver-full -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DTDESKTOP_API_TEST=ON
        cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
