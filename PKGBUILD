# Maintainer: networkException <git@nwex.de>

pkgname=ungoogled-chromium-bin
pkgver=122.0.6261.94
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
provides=("chromium=$pkgver" "chromedriver=$pkgver")
conflicts=('chromium' 'chromedriver')
source=(https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$pkgrel/ungoogled-chromium-$pkgver-$pkgrel-x86_64.pkg.tar.zst)
sha256sums=('1e2315d7cc0361bc76eee20c113b613d6df38a4245958f8bac4e750ed314727d')

declare -gA _system_libs=(
    #[brotli]=brotli
    [dav1d]=dav1d
    [ffmpeg]=ffmpeg
    [flac]=flac
    [fontconfig]=fontconfig
    [freetype]=freetype2
    [harfbuzz-ng]=harfbuzz
    [icu]=icu
    [jsoncpp]=jsoncpp
    #[libaom]=aom
    [libavif]=libavif
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
