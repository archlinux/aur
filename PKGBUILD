# Maintainer: networkException <git@nwex.de>

pkgname=ungoogled-chromium-bin
pkgver=111.0.5563.64
pkgrel=1
pkgdesc="A lightweight approach to removing Google web service dependency"
arch=('x86_64')
url="https://github.com/ungoogled-software/ungoogled-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma')
provides=('chromium')
conflicts=('chromium')
source=(https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$pkgrel/ungoogled-chromium-$pkgver-$pkgrel-x86_64.pkg.tar.zst)
sha256sums=('391c77667133e8913cf8f6e916909989e25cf48cd350db59b4821893c8b0f545')

declare -gA _system_libs=(
    [brotli]=brotli
    [dav1d]=dav1d
    [ffmpeg]=ffmpeg
    [flac]=flac
    [fontconfig]=fontconfig
    [freetype]=freetype2
    [harfbuzz-ng]=harfbuzz
    [icu]=icu
    [jsoncpp]=jsoncpp
    [libaom]=aom
    #[libavif]=libavif # https://github.com/AOMediaCodec/libavif/commit/4d2776a3
    [libdrm]=
    [libjpeg]=libjpeg
    [libpng]=libpng
    #[libvpx]=libvpx
    [libwebp]=libwebp
    [libxml]=libxml2
    [libxslt]=libxslt
    [opus]=opus
    [re2]=re2
    [snappy]=snappy
    [woff2]=woff2
    [zlib]=minizip
)
_unwanted_bundled_libs=(
    $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"

    chown root "$pkgdir/usr/lib/chromium/chrome-sandbox"
    chmod 4755 "$pkgdir/usr/lib/chromium/chrome-sandbox"
}
