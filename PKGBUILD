pkgname=ayugram-desktop-bin-updated
pkgver=6.9.3.updated
pkgrel=1
pkgdesc="Desktop Telegram client with good customization and Ghost mode. Local updated binary test build."
arch=(x86_64)
url="https://github.com/AyuGram/AyuGramDesktop"
license=('GPL-3.0-or-later')
depends=(
    'abseil-cpp' 'ada' 'ffmpeg' 'glib2' 'glibc' 'hicolor-icon-theme'
    'hunspell' 'kcoreaddons' 'libavif' 'libdispatch' 'libgcc' 'libheif'
    'libjpeg-turbo' 'libjxl' 'libstdc++' 'libvpx' 'libx11' 'libxcb'
    'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
    'libxrandr' 'libxtst' 'lz4' 'minizip' 'openal' 'openh264' 'openssl'
    'opus' 'libpipewire' 'protobuf' 'qt6-base' 'qt6-declarative'
    'qt6-svg' 'qt6-wayland' 'qrcodegencpp' 'rnnoise'
    'xcb-util-keysyms' 'xxhash' 'zlib'
)
makedepends=('cmake')
optdepends=(
    'geoclue: geoinformation support'
    'geocode-glib-2: geocoding support'
    'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
    'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
    'xdg-desktop-portal: desktop integration'
)
options=('!debug')
provides=('ayugram-desktop')
conflicts=('ayugram-desktop'
           'ayugram-desktop-bin'
           'ayugram-desktop-updated')

source=()
sha256sums=()

package() {
    DESTDIR="$pkgdir" cmake --install /home/braulio/Projects/AyuGramDesktop/out-generic --prefix /usr
    perl -0pi -e 's|Exec=/usr/local/bin/AyuGram|Exec=/usr/bin/AyuGram|' \
        "$pkgdir/usr/share/dbus-1/services/com.ayugram.desktop.service"
    objcopy --remove-section .note.gnu.property "$pkgdir/usr/bin/AyuGram"
}
