pkgname=ayugram-desktop-updated
pkgver=6.9.3.updated
pkgrel=1
pkgdesc="Desktop Telegram client with good customization and Ghost mode. Local updated test build."
arch=("x86_64")
url="https://github.com/AyuGram/AyuGramDesktop"
license=("GPL-3.0-or-later WITH OpenSSL-exception")
depends=('abseil-cpp'
         'ada'
         'ffmpeg'
         'glib2'
         'glibc'
         'hicolor-icon-theme'
         'hunspell'
         'kcoreaddons'
         'libavif'
         'libdispatch'
         'libgcc'
         'libheif'
         'libjpeg-turbo'
         'libjxl'
         'libpipewire'
         'libstdc++'
         'libvpx'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxkbcommon'
         'libxrandr'
         'libxtst'
         'lz4'
         'minizip'
         'openal'
         'openh264'
         'openssl'
         'opus'
         'pipewire'
         'protobuf'
         'qt6-base'
         'qt6-declarative'
         'qt6-imageformats'
         'qt6-svg'
         'qt6-wayland'
         'qrcodegencpp'
         'rnnoise'
         'xcb-util-keysyms'
         'xxhash'
         'zlib')
optdepends=('geoclue: geoinformation support'
            'crow-translate: translation provider'
            'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
            'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
            'xdg-desktop-portal: desktop integration')
options=('!debug')
source=("AyuGram::file:///home/braulio/Projects/AyuGramDesktop/out/Release/AyuGram"
        "com.ayugram.desktop.desktop::file:///home/braulio/Projects/AyuGramDesktop/lib/xdg/com.ayugram.desktop.desktop"
        "com.ayugram.desktop.svg::file:///home/braulio/Projects/AyuGramDesktop/Telegram/Resources/art/ayu/default/app.svg")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 AyuGram "$pkgdir/usr/bin/AyuGram-updated"
    install -Dm644 com.ayugram.desktop.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.ayugram.desktop.updated.svg"

    install -Dm644 com.ayugram.desktop.desktop \
        "$pkgdir/usr/share/applications/com.ayugram.desktop.updated.desktop"
    sed -i \
        -e 's/^Name=.*/Name=AyuGram Desktop Updated/' \
        -e 's/^TryExec=.*/TryExec=AyuGram-updated/' \
        -e 's/^Exec=env DESKTOPINTEGRATION=1 AyuGram -- %U/Exec=env DESKTOPINTEGRATION=1 AyuGram-updated -- %U/' \
        -e 's/^Exec=AyuGram -quit/Exec=AyuGram-updated -quit/' \
        -e 's/^Icon=.*/Icon=com.ayugram.desktop.updated/' \
        -e 's/^StartupWMClass=.*/StartupWMClass=AyuGram-updated/' \
        "$pkgdir/usr/share/applications/com.ayugram.desktop.updated.desktop"
}
