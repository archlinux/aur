##Copied from official telegram-desktop PKGBUILD.
##If you spot any issues, please don't hesitate to email me.
##Email: pony at just-a-pony dot net
pkgname=yukigram-desktop
pkgver=5.13.1
pkgrel=0
pkgdesc='A Fork of 64Gram,A Telegram Desktop fork'
arch=('x86_64')
url="https://github.com/yukigram/yukigram/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
    'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'ada'
    'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'libxdamage' 'abseil-cpp' 'libdispatch'
    'openssl' 'protobuf' 'glib2' 'kcoreaddons' 'openh264')
makedepends=('cmake' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
        'libtg_owt' 'gobject-introspection' 'boost' 'glib2-devel' 'git')
optdepends=('geoclue: geoinformation support'
        'geocode-glib: geocoding support'
        'geocode-glib-2: geocoding support'
        'webkit2gtk: embedded browser features provided by webkit2gtk'
        'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
        'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
        'xdg-desktop-portal: desktop integration')
source=("yukigram::git+https://github.com/yukigram/yukigram.git#tag=yukigram-${pkgver}")
sha512sums=( SKIP )
prepare() {
    cd yukigram
    git submodule update --init --recursive
}
build() {
    CXXFLAGS+=' -ffat-lto-objects'
    cmake -B build -S yukigram -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    cmake --build build
}
package() {
    DESTDIR="$pkgdir" cmake --install build
}

